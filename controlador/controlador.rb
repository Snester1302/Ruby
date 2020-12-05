class Controlador 
    attr_reader :vista, :modelo 
    def initialize(vista, modelo)
       @vista=vista
       @modelo = modelo
    end
    def registrarMedico(tipo, *arg)
       medico = Factory.generarObjeto(tipo,*arg)
       begin
         modelo.registrarMedico(medico)
         vista.mostrar("Medico registrado con exito!!")
       rescue Exception => e
         vista.mostrarExcepcion(e.message)  
       end
    end
    def listarMedicos
       arreglo = modelo.arregloMedicos
       return arreglo
    end
    def medicoMayorSueldo
       medico = modelo.medicoMayorSueldo
       return medico
    end
    def registrarPaciente(tipo, *arg)
       paciente = Factory.generarObjeto(tipo,*arg)
       begin
          modelo.registrarPaciente(paciente)
          vista.mostrar("Paciente registrado con exito!!")
       rescue Exception => e 
          vista.mostrarExcepcion(e.message)  
       end 
     
    end  
    def listarPacientes
       arreglo = modelo.arregloPacientes
       return arreglo
    end
    def buscarPaciente(dni)
       paciente = modelo.buscarPaciente(dni)
       return paciente
    end
    def buscarMedico(dni)
      medico = modelo.buscarMedico(dni)
      return medico
    end 
    def registrarCita(tipo,*arg)
       cita = Factory.generarObjeto(tipo,*arg)
       begin
         modelo.registrarCita(cita)
         vista.mostrar("Cita registrado con exito!!")
       rescue Exception => e 
         vista.mostrarExcepcion(e.message)  
       end     
    end 
    def listarCitas
       arreglo = modelo.arregloCitas
       return arreglo
    end
    def buscarCitasMedico(dni)
       arreglo = modelo.buscarCitasMedico(dni)
       return arreglo
    end
    def detallesCitasMedico(dni)
       arreglo = modelo.detallesCitasMedico(dni)
       return arreglo
    end
    def buscarCitasPaciente(dni)
       arreglo = modelo.buscarCitasPaciente(dni)
       return arreglo
    end
end 