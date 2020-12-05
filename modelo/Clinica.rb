require 'singleton'
require '../controlador/factory'
require '../controlador/controlador'

class Medico 
 attr_reader :codigoMedico, :nombreMedico,:apellidosMedico,:dniMedico,:sexoMedico
 def initialize (codigoMedico,nombreMedico,apellidosMedico,dniMedico,sexoMedico)
 	 @codigoMedico = codigoMedico
 	 @nombreMedico = nombreMedico
 	 @apellidosMedico = apellidosMedico
 	 @dniMedico = dniMedico
 	 @sexoMedico = sexoMedico
 end
 def calcularSueldoBase
 end
 def calcularSueldoTotal
 end
 def tipoMedico 
 end
end

class Especialista < Medico
 attr_reader :nombreespecialidad  
 def initialize(codigoMedico,nombreMedico,apellidosMedico,dniMedico,sexoMedico,nombreespecialidad)
 	super(codigoMedico,nombreMedico,apellidosMedico,dniMedico,sexoMedico)
 	@nombreespecialidad = nombreespecialidad
 end
 def calcularSueldoBase
      if nombreespecialidad == "Traumatologia"
      	return 5000
      elsif nombreespecialidad == "Dermatologia"
      	return 5500
      elsif nombreespecialidad == "Neumologia"
      	return 5800
      elsif nombreespecialidad == "Cardiologia"
      	return 6000   
      else
        return 4800	      	
  	 end
 end
 def calcularSueldoTotal
	  return (calcularSueldoBase - (calcularSueldoBase * 0.1))
 end
 def tipoMedico
    return "E"
 end 
end

class General < Medico
 attr_reader :aniosExperiencia 
 def initialize(codigoMedico,nombreMedico,apellidosMedico,dniMedico,sexoMedico,aniosExperiencia)
 	   super(codigoMedico,nombreMedico,apellidosMedico,dniMedico,sexoMedico)
 	   @aniosExperiencia = aniosExperiencia
 end
 def calcularSueldoBase
     if aniosExperiencia >= 10
    	  return 4500
     else
    	  return 4000
     end  		
 end
 def calcularSueldoTotal
	   return (calcularSueldoBase - (calcularSueldoBase * 0.09))
 end
 def tipoMedico
     return "G"
 end 
end

class Paciente 
 attr_reader :codigoPaciente, :nombrePaciente, :apellidosPaciente, :dniPaciente, :edadPaciente, :sexoPaciente, :telefPaciente
 def initialize(codigoPaciente,nombrePaciente,apellidosPaciente,dniPaciente,edadPaciente,sexoPaciente,telefPaciente)
    @codigoPaciente = codigoPaciente
    @nombrePaciente = nombrePaciente
    @apellidosPaciente = apellidosPaciente
    @dniPaciente = dniPaciente
    @edadPaciente = edadPaciente
    @sexoPaciente = sexoPaciente
    @telefPaciente = telefPaciente   
 end
 def determinarEtapaVida
    if edadPaciente >= 0 and edadPaciente <= 5
       return "Infancia"
    elsif edadPaciente >= 6 and edadPaciente <= 11
       return "Niñez"
    elsif edadPaciente >= 12 and edadPaciente <= 17
       return "Adolescencia"   
    elsif edadPaciente >= 18 and edadPaciente <= 26
       return "Joven"
    elsif edadPaciente >= 27 and edadPaciente <= 59
       return "Adultez"
    elsif edadPaciente >= 60
       return "Vejez"
    end  
 end
end

class CitaMedica
  attr_reader :codigoCita, :fechaCita, :paciente, :medico
  def initialize(codigoCita,fechaCita,paciente,medico)
     @codigoCita = codigoCita
     @fechaCita = fechaCita
     @paciente = paciente
     @medico = medico  
  end
  def calcularDescuento
     if paciente.determinarEtapaVida == "Infancia"
         return 4
     elsif paciente.determinarEtapaVida == "Niñez"
         return 3.5
     elsif paciente.determinarEtapaVida == "Adolescencia"
         return 3
     elsif paciente.determinarEtapaVida == "Joven"
         return 1.5
     elsif paciente.determinarEtapaVida == "Adultez"
         return 2.5
     elsif paciente.determinarEtapaVida == "Vejez"
         return 4.5                                                                               
     end
  end
  def calcularCostoCita
     return (80 - calcularDescuento)   
  end
end

class Administrador   #MODELO
    include Singleton
    attr_reader :arregloMedicos, :arregloPacientes, :arregloCitas
    def initialize()
      @arregloMedicos = []
      @arregloPacientes = []
      @arregloCitas = []
    end
    def registrarMedico(medico)
      if validarDniMedico(medico.dniMedico)
          arregloMedicos.push(medico)
      end     
    end
    def validarDniMedico(dni)
      for medico in arregloMedicos
        if medico.dniMedico == dni
          raise "Ya existe un dni igual al medico, no se puede registrar!!"
        end
      end
      return true
    end
    def registrarPaciente(paciente)
      if validarDniPaciente(paciente.dniPaciente)
           arregloPacientes.push(paciente)
      end   
    end
    def validarDniPaciente(dni)
      for paciente in arregloPacientes
        if paciente.dniPaciente == dni
          raise "Ya existe un dni igual al paciente, no se puede registrar!!"
        end
      end
      return true
    end
    def buscarPaciente(dni)
       for paciente in arregloPacientes
          if paciente.dniPaciente == dni
             return paciente
          end
       end
       return nil
    end
    def buscarMedico(dni)
       for medico in arregloMedicos
          if medico.dniMedico == dni
              return medico
          end
       end
       return nil
    end
    def registrarCita(cita)
      if validarCodigoCita(cita.codigoCita)
          arregloCitas.push(cita)
      end   
    end    
    def validarCodigoCita(codigo)
      for cita in arregloCitas
        if cita.codigoCita == codigo
          raise "Ya existe un codigo igual a la cita, no se puede registrar!!"
        end
      end
      return true
    end    
    def buscarCitasMedico(dni)
        arreglo = []
        for cita in arregloCitas 
           if cita.medico.dniMedico == dni
              arreglo.push(cita)
           end
        end
        return arreglo
    end
    def detallesCitasMedico(dni)
       arreglo = []
       cantinf = 0
       cantnin = 0
       cantado = 0
       cantjov = 0
       cantadu = 0
       cantvej = 0
       for cita in arregloCitas 
          if cita.medico.dniMedico == dni
              if cita.paciente.determinarEtapaVida == "Infancia"
                 cantinf = cantinf + 1
              elsif cita.paciente.determinarEtapaVida == "Niñez"
                 cantnin = cantnin + 1 
              elsif cita.paciente.determinarEtapaVida == "Adolescencia"
                 cantado = cantado + 1 
              elsif cita.paciente.determinarEtapaVida == "Joven"
                 cantjov = cantjov + 1 
              elsif cita.paciente.determinarEtapaVida == "Adultez"
                 cantadu = cantadu + 1 
              elsif cita.paciente.determinarEtapaVida == "Vejez"
                 cantvej = cantvej + 1 
              end 
          end
       end
       arreglo = [cantinf, cantnin, cantado, cantjov, cantadu, cantvej]
       return arreglo
    end
    def buscarCitasPaciente(dni)
       arreglo = []
       for cita in arregloCitas
          if cita.paciente.dniPaciente == dni
             arreglo.push(cita)
          end
       end
       return arreglo
    end
    def medicoMayorSueldo
       mayor = 0
       medicoobj = nil
       for medico in arregloMedicos
         if medico.calcularSueldoTotal >= mayor
              medicoobj = medico
              mayor = medico.calcularSueldoTotal
         end
       end
       return medicoobj
    end
end







