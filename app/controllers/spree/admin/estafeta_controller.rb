class Spree::Admin::EstafetaController <  ApplicationController
	
	before_action :set_shipment, only: [:create_label, :download_waybill]

	def create_label
		
		service = EstafetaService.new
		
		response = service.create_label_request(@shipment.order) if @shipment.order.present?
		
		if response.global_result.result_code == "0"
			
			file_name = "#{response.label_request_list.first.result_description}"
			
			#temp_file = Tempfile.create( file_name, 'tmp/estafeta_waybills')
			path_for_waybills = Rails.application.config.estafeta_service[:path_for_waybills]
			temp_file = File.new("#{path_for_waybills}/#{file_name}", 'w')
			
			decoded_data = Base64.decode64(response.label_pdf)
   		File.open(temp_file, 'wb') {|f| f.write(decoded_data)}	
			
			@shipment.tracking = response.label_request_list.first.result_description
			@shipment.file_path = temp_file.path
			
			if(@shipment.save!)
				
				flash[:success] = response.global_result.result_description
			else
				#deliver file not saved
				flash[:error] = "La guia se creo pero no se almaceno se ha enviado un correo con el detalle de la guia generada"
			end

			redirect_to edit_admin_order_path(@shipment.order)

		else
			flash[:error] = "La guia de estafeta no fue recibida"
			redirect_to edit_admin_order_path(@shipment.order)
		end

	end

	def execute_query
		label_code = params[:id]
	end

	def download_waybill
		send_file @shipment.file_path, :type => 'application/pdf', :filename => "#{@shipment.tracking}.pdf"
	end

	private 
		def set_shipment
			@shipment = Spree::Shipment.find_by_number(params[:id])
		end
end
