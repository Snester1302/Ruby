class Factory
  def self.generarObjeto(tipo, *arg)
    case tipo
       when "me"
         Especialista.new(arg[0], arg[1], arg[2], arg[3], arg[4], arg[5])
       when "mg"
         General.new(arg[0], arg[1], arg[2], arg[3], arg[4], arg[5]) 
       when "pac"
         Paciente.new(arg[0], arg[1], arg[2], arg[3], arg[4], arg[5], arg[6])  
       when "cit"
         CitaMedica.new(arg[0], arg[1], arg[2], arg[3])           
    end  
  end
end