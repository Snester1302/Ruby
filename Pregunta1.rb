=begin
	
Una empresa de cine virtual vende entradas para funciones en línea. Por ello, requiere de un programa que permita registrar 
una venta y generar el boleto al usuario final. Considere un programa con una clase Boleta con los siguientes atributos: 
código, fecha compra (dd/mm/yyyy), nombre de la función, el precio venta de la entrada (incluye IGV).
Se solicita desarrollar un programa orientado a objetos tal que permita:

a)	Mostrar los datos de la venta incluyendo el monto por IGV cobrado y precio de venta de la entrada, considere el IGV=18%.
b)	Elaborar un método que permita modificar el precio de la entrada y al hacer sus pruebas: primero muestre todos los datos 
de una venta, a continuación, modifique el precio de la entrada y vuelva a mostrar los datos de la venta.

=end


class Boleta

	 attr_reader :código, :fechacompra, :nombrefunción, :pventaentrada

	def initialize(código, fechacompra, nombrefunción, pventaentrada)
		
		@código = código
		@fechacompra= fechacompra
		@nombrefunción = nombrefunción
		@pventaentrada = pventaentrada
		

	end

    def calcular_precio_venta_no_igv

		return (@pventaentrada/1.18).round(2)

	end

	def cambiarPventa(nuevoPrecio)

        print "############################# DATOS DE LA BOLETA ################################" "\n" "\n"
        puts datos()
		print "############################# EL NUEVO PRECIO DE VENTA ES ################################" "\n" "\n"
		@pventaentrada = nuevoPrecio
		puts datos()

	end

	def datos()

		puts "Código :#{@código}"
		puts "Fecha de Compra :#{@fechacompra}"
		puts "Nombre de la Función :#{@nombrefunción}"
		puts "Precio de Venta :#{calcular_precio_venta_no_igv}"

	end

end

#Test

bo = Boleta.new("25TR865", "13/02/2020", "El conjuro 3", 24.5)
bo.cambiarPventa(17.6)

