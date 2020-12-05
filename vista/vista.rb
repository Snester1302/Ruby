require '../controlador/factory'
require '../controlador/controlador'
require '../modelo/Clinica'

class Vista  
  $controlador = nil  
  def menuPrincipal(controlador)  
    $controlador = controlador
    cargaMasiva
    op = 0
    puts ""
    puts "-------------------------------------------------------------------------------"
    puts "\t\t\tBIENVENIDO AL SISTEMA DE CITAS MEDICAS" 
    puts "-------------------------------------------------------------------------------"
    begin
       puts "---------------------------------"
       puts "     MENU PRINCIPAL OPCIONES     |"
       puts "---------------------------------"
       puts "(1) MEDICOS                      |"
       puts "(2) PACIENTES                    |"  
       puts "(3) CITAS                        |"
       puts "(4) SALIR                        |"
       puts "---------------------------------"
       print "*Ingrese Opcion: "
       op = gets.chomp.to_i
       if  op < 1 or op > 4
          puts "¡Opcion No Valida!"
          puts ""
       end 
       case op
           when 1
              puts ""
              menuMedicos()
           when 2 
              puts ""
              menuPacientes() 
           when 3
              puts ""
              menuCitas()
       end
    end while op != 4
  end
  def cargaMasiva
      #CARGA MASIVA DE MEDICOS
      $controlador.registrarMedico("me","1","Cesar Luis","Castillo Ramirez","12345678","M","Traumatologia")
      $controlador.registrarMedico("me","2","Maria Juana","Velazquez Soto","87654321","F","Dermatologia")
      $controlador.registrarMedico("me","3","Ivan Carlos","Principe Ramos","33334444","M","Neumologia")
      $controlador.registrarMedico("mg","4","Julia Eva","Bernal Torres","33332222","F", 8)
      $controlador.registrarMedico("mg","5","Arnold Alonso", "Rosa Tor", "11116666", "M" , 15)
      $controlador.registrarMedico("mg","6", "Rosa Flor", "Pineda Romero", "77773333", "F", 13)

      #CARGA MASIVA DE PACIENTES
      $controlador.registrarPaciente("pac","1","Juan Jose","Rosal Maldonado","43218765",36,"M","123456789")
      $controlador.registrarPaciente("pac","2","Mercedez Luana","Trujillo Lopez","92323244",23,"F","829892321")
      $controlador.registrarPaciente("pac","3","Karen Karina","Rivera Lino","87687236",40,"F","898903822")
      $controlador.registrarPaciente("pac","4","Miluska Maria","Lino Torres","32323221",12,"F","534535435")
      $controlador.registrarPaciente("pac","5","Carlos Juan","Perez Villanueva","23243431",16,"M","332324342")
      $controlador.registrarPaciente("pac","6","Alberto Lucas","Rios Rivera","76767662",20,"M","898923165")
      $controlador.registrarPaciente("pac","7","Lila Lorena","Ramirez Castillo","87868678",28,"F","897887921")
      $controlador.registrarPaciente("pac","8","Jose Lorenzo","Toribio Tume","88686732",18,"M","767657652")

      #CARGA MASIVA DE CITAS
      pac1 = $controlador.buscarPaciente("43218765")
      pac2 = $controlador.buscarPaciente("92323244")
      pac3 = $controlador.buscarPaciente("87687236")
      pac4 = $controlador.buscarPaciente("32323221")
      pac5 = $controlador.buscarPaciente("23243431")
      pac6 = $controlador.buscarPaciente("76767662")
      pac7 = $controlador.buscarPaciente("87868678")
      pac8 = $controlador.buscarPaciente("88686732")
      me1 = $controlador.buscarMedico("12345678")
      me2 = $controlador.buscarMedico("87654321")
      me3 = $controlador.buscarMedico("33334444")
      mg3 = $controlador.buscarMedico("77773333")
      mg1 = $controlador.buscarMedico("33332222")
      mg2 = $controlador.buscarMedico("11116666")

      $controlador.registrarCita("cit","1","2020/11/11",pac1,me1)
      $controlador.registrarCita("cit","2","2020/08/25",pac2,me1)
      $controlador.registrarCita("cit","3","2020/09/10",pac1,me2)
      $controlador.registrarCita("cit","4","2020/07/23",pac3,mg3)
      $controlador.registrarCita("cit","5","2020/05/21",pac5,mg1)
      $controlador.registrarCita("cit","6","2020/03/11",pac4,me3)
      $controlador.registrarCita("cit","7","2020/10/05",pac7,mg2)
      $controlador.registrarCita("cit","8","2020/11/09",pac8,me1)
      $controlador.registrarCita("cit","9","2020/07/10",pac6,mg3)
      $controlador.registrarCita("cit","10","2020/09/11",pac4,me1)
  end
  def menuMedicos   
    op = 0
    begin
       puts ""
       puts "---------------------------------"
       puts "     MENU MEDICOS               |"
       puts "---------------------------------"
       puts "(1) Registrar Medico            |"
       puts "(2) Listar Medicos              |"
       puts "(3) Buscar Medico               |"
       puts "(4) Medico Mayor Sueldo         |"
       puts "(5) Retroceder                  |"
       puts "---------------------------------"
       print "ingrese opcion: "
       op = gets.chomp.to_i
       if  op < 1 or op > 5
         puts "opcion no valida!!"
         puts ""
       end    
       case op
           when 1
               puts ""
               registrarMedico()
           when 2
               puts ""
               listarMedicos()
           when 3
               puts ""
               buscarMedico()
           when 4
               puts ""
               medicoMayorSueldo()     
       end
    end while op != 5
    puts ""
  end
  def registrarMedico
      puts "-------------------------------------------------------------------------------"
      puts "\t\t\t\tREGISTRAR DE MEDICO"
      puts "-------------------------------------------------------------------------------"
      print "*Ingrese codigo: "
      codigo = gets.chomp.to_s
      print "*Ingrese Nombres: "
      nombre = gets.chomp.to_s
      print "*Ingrese Apellidos: "
      apellidos = gets.chomp.to_s
      print "*Ingrese N° DNI: "
      dni = gets.chomp.to_s
      print "*Ingrese Sexo (M/F): "
      sexo = gets.chomp.to_s
      puts "-------------------------- "
      puts "*Seleccione tipo:         |"
      puts "->(1)Medico Especialista  |" 
      puts "->(2)Medico General       |" 
      puts "-------------------------- "    
      print "Ingrese opcion:"
      op = gets.chomp.to_i
      if op == 1
         print "*Ingrese Nombre Especialidad: "
         nombreespecialidad = gets.chomp.to_s 
         $controlador.registrarMedico("me",codigo,nombre,apellidos,dni,sexo,nombreespecialidad)        
      else
         print "*Ingrese Años Experiencia:"
         aniosexperiencia = gets.chomp.to_i 
         $controlador.registrarMedico("mg",codigo,nombre,apellidos,dni,sexo,aniosexperiencia)  
      end
      
  end  
  def mostrar(mensaje)
     puts "-------------------------------------------------------------------------------"
     puts "\t\t\t"+mensaje
  end
 def mostrarExcepcion(mensaje)
     puts "-------------------------------------------------------------------------------"
     puts "\t"+mensaje
  end
  def listarMedicos
     arreglo = $controlador.listarMedicos
     sum1 = 0
     sum2 = 0
     puts "-------------------------------------------------------------------------------"
     puts "\t\t\tLISTA - MEDICOS ESPECIALISTAS"
     puts "-------------------------------------------------------------------------------"
     puts "Nombres\t\t\t\tDni\t\tEspec.\t\tS.B\tS.T"
     puts "-------------------------------------------------------------------------------"
     for medico in arreglo   
        if medico.tipoMedico == "E"
            puts "#{medico.nombreMedico} #{medico.apellidosMedico}\t#{medico.dniMedico}\t#{medico.nombreespecialidad}\t#{medico.calcularSueldoBase}\t#{medico.calcularSueldoTotal}"
            sum1 = sum1 + medico.calcularSueldoTotal
        end      
     end
     puts "-------------------------------------------------------------------------------"
     puts "SUMA SUELDOS TOTALES: #{sum1}"
     puts "-------------------------------------------------------------------------------"
     puts ""
     puts "-------------------------------------------------------------------------------"
     puts "\t\t\tLISTA - MEDICOS GENERALES"
     puts "-------------------------------------------------------------------------------"
     puts "Nombres\t\t\t\tDni\t\tExper.\t\tS.B\tS.T"
     puts "-------------------------------------------------------------------------------"
     for medico in arreglo    
        if medico.tipoMedico == "G"
            puts "#{medico.nombreMedico} #{medico.apellidosMedico}\t\t#{medico.dniMedico}\t#{medico.aniosExperiencia}\t#{medico.calcularSueldoBase}\t#{medico.calcularSueldoTotal}"
            sum2 = sum2 + medico.calcularSueldoTotal
        end      
     end
     puts "-------------------------------------------------------------------------------"
     puts "SUMA SUELDOS TOTALES: #{sum2}"
     puts "-------------------------------------------------------------------------------"
 end
 def buscarMedico
     puts "-------------------------------------------------------------------------------"
     puts "\t\t\t\tBUSQUEDA DE MEDICO"
     puts "-------------------------------------------------------------------------------"
     print "INGRESE N° DNI DEL MEDICO: "
     dni = gets.chomp.to_s
     puts ""
     medico = $controlador.buscarMedico(dni)
     if medico != nil
           puts "-------------------------------------------------------------------------------"
           puts "\t\t\t\tDATOS DE MEDICO"
           puts "-------------------------------------------------------------------------------"
           if medico.tipoMedico == "E"
                 puts "Nombres\t\t\t\tDni\t\tEspec.\t\tS.B\tS.T"
                 puts "-------------------------------------------------------------------------------"
                 puts "#{medico.nombreMedico} #{medico.apellidosMedico}\t#{medico.dniMedico}\t#{medico.nombreespecialidad}\t#{medico.calcularSueldoBase}\t#{medico.calcularSueldoTotal}"
           elsif medico.tipoMedico == "G"
                 puts "Nombres\t\t\t\tDni\t\tExper.\t\tS.B\tS.T"
                 puts "-------------------------------------------------------------------------------"
                 puts "#{medico.nombreMedico} #{medico.apellidosMedico}\t\t#{medico.dniMedico}\t#{medico.aniosExperiencia}\t#{medico.calcularSueldoBase}\t#{medico.calcularSueldoTotal}"       
           end
     else
       puts "¡No se encontro ningun medico!"
     end
     puts "-------------------------------------------------------------------------------"
  end
  def medicoMayorSueldo
     puts "-------------------------------------------------------------------------------"
     puts "\t\t\t\tMEDICO MAYOR SUELDO"
     puts "-------------------------------------------------------------------------------"  
     medico = $controlador.medicoMayorSueldo
      if medico != nil         
           if medico.tipoMedico == "E"
                 puts "Nombres\t\t\t\tDni\t\tEspec.\t\tS.B\tS.T"
                 puts "-------------------------------------------------------------------------------"
                 puts "#{medico.nombreMedico} #{medico.apellidosMedico}\t#{medico.dniMedico}\t#{medico.nombreespecialidad}\t#{medico.calcularSueldoBase}\t#{medico.calcularSueldoTotal}"
           elsif medico.tipoMedico == "G"
                 puts "Nombres\t\t\t\tDni\t\tExper.\t\tS.B\tS.T"
                 puts "-------------------------------------------------------------------------------"
                 puts "#{medico.nombreMedico} #{medico.apellidosMedico}\t\t#{medico.dniMedico}\t#{medico.aniosExperiencia}\t#{medico.calcularSueldoBase}\t#{medico.calcularSueldoTotal}"       
           end
     else
       puts "¡No existen medicos!"
     end
     puts "-------------------------------------------------------------------------------" 
  end
  def menuPacientes
     op = 0
     begin
        puts ""
        puts "--------------------------------"
        puts "     MENU PACIENTES              |"
        puts "---------------------------------"
        puts "(1) Registrar Paciente          |"
        puts "(2) Listar Pacientes            |"
        puts "(3) Buscar Paciente             |"
        puts "(4) Retroceder                  |"
        puts "--------------------------------"
        print "ingrese opcion: "
        op = gets.chomp.to_i
        if op < 1 or op > 4
           puts "opcion no valida!!"
           puts ""
        end      
        case op
          when 1
            puts ""
            registrarPaciente()
          when 2
            puts ""
            listarPacientes()
          when 3
            puts ""
            buscarPaciente()
        end
     end while op != 4
     puts ""
  end
  def registrarPaciente
     puts "-------------------------------------------------------------------------------"
     puts "\t\t\t\tREGISTRAR DE PACIENTE"
     puts "-------------------------------------------------------------------------------"
     print "*Ingrese codigo: "
     codigo = gets.chomp.to_s
     print "*Ingrese nombres: "
     nombre = gets.chomp.to_s
     print "*Ingrese apellidos: "
     apellidos = gets.chomp.to_s
     print "*Ingrese DNI: "
     dni = gets.chomp.to_s
     print "*Ingrese Edad: "
     edad = gets.chomp.to_i
     print "*Ingrese Sexo (M/F): "
     sexo = gets.chomp.to_s
     print "*Ingrese Telf./Cel.: "
     telf = gets.chomp.to_s
     $controlador.registrarPaciente("pac",codigo,nombre,apellidos,dni,edad,sexo,telf)
  end
  def listarPacientes
     arreglo = $controlador.listarPacientes
     puts "-------------------------------------------------------------------------------"
     puts "\t\t\tLISTA - PACIENTES"
     puts "-------------------------------------------------------------------------------"
     puts "codigo   nombres   apellidos   DNI   edad   sexo"
     puts "-------------------------------------------------------------------------------"
     for paciente in arreglo 
         puts "#{paciente.codigoPaciente}  #{paciente.nombrePaciente}  #{paciente.apellidosPaciente}  #{paciente.dniPaciente}  #{paciente.edadPaciente}  #{paciente.sexoPaciente}"
     end 
     puts "-------------------------------------------------------------------------------"
  end
  def buscarPaciente
     puts "-------------------------------------------------------------------------------"
     puts "\t\t\t\tBUSQUEDA DEL PACIENTE"
     puts "-------------------------------------------------------------------------------"
     print "INGRESE N° DNI DEL PACIENTE: "
     dni = gets.chomp.to_s
     paciente = $controlador.buscarPaciente(dni)
     if paciente != nil
       puts "-------------------------------------------------------------------------------"
       puts "\t\t\t\tDATOS DEL PACIENTE"
       puts "-------------------------------------------------------------------------------"
       puts "codigo   nombres   apellidos   DNI   edad   sexo"
       puts "-------------------------------------------------------------------------------"
       puts "#{paciente.codigoPaciente}  #{paciente.nombrePaciente}  #{paciente.apellidosPaciente}  #{paciente.dniPaciente}  #{paciente.edadPaciente}  #{paciente.sexoPaciente}"
     else
       puts "¡No se encontro ningun paciente!"
     end
     puts "---------------------------------------------------------------------------------"  
  end
  def menuCitas  
    op = 0
    begin
      puts ""
      puts "----------------------------------"
      puts "           MENU CITAS             |"
      puts "----------------------------------"
      puts "(1) Registrar Cita                |"
      puts "(2) Listar Citas                  |"
      puts "(3) Buscar Citas del Medico       |"
      puts "(4) Detalles Citas del Medico     |"
      puts "(5) Buscar Citas del Paciente     |"
      puts "(6) Retroceder                    |"
      puts "----------------------------------"
      print "ingrese opcion: "
      op = gets.chomp.to_i
      if  op < 1 or op > 6
       puts "opcion no valida!!"
       puts ""
      end      
      case op
        when 1
          puts ""
          registrarCita()
        when 2
          puts ""
          listarCitas()
        when 3
          puts ""
          buscarCitasMedico()  
        when 4
          puts ""
          detallesCitasMedico()  
        when 5
          puts ""
          buscarCitasPacientes()       
      end
    end while op != 6
    puts ""
  end 
  def registrarCita
    puts "-------------------------------------------------------------------------------"
    puts "\t\t\t\tREGISTRAR CITA"
    puts "-------------------------------------------------------------------------------"  
    print "*Ingrese codigo: "
    codigo = gets.chomp.to_s
    print "*Ingrese fecha Fecha (yyyy/mm/dd): "
    fecha = gets.chomp.to_s
    puts "-------------------------------------------------------------------------------"  
    puts "Datos del Paciente: "
    puts "-------------------------------------------------------------------------------" 
    begin
      print "*Ingrese n° dni del paciente: "
      dni1 = gets.chomp.to_s
      paciente = $controlador.buscarPaciente(dni1)
      if paciente == nil
          puts "¡No se encontro ningun paciente!"
      else
          puts "Paciente selecionado:"
          puts "codigo   nombres   apellidos   DNI "
          puts "#{paciente.codigoPaciente} #{paciente.nombrePaciente}  #{paciente.apellidosPaciente} #{paciente.dniPaciente}"     
      end
      puts ""
    end while paciente == nil    
    puts "-------------------------------------------------------------------------------"  
    puts "Datos del Medico: "
    puts "-------------------------------------------------------------------------------" 
    begin
      print "*Ingrese n° dni del medico: "
      dni2 = gets.chomp.to_s
      medico = $controlador.buscarMedico(dni2)
      if medico == nil
          puts "¡No se encontro ningun medico!"
      else
          puts "medico seleccionado:"
          puts "codigo   nombres   apellidos   DNI "
          puts "#{medico.codigoMedico}  #{medico.nombreMedico}  #{medico.apellidosMedico}  #{medico.dniMedico}"
      end
      puts "-------------------------------------------------------------------------------"  
      puts ""
    end while medico == nil   
    $controlador.registrarCita("cit",codigo,fecha,paciente,medico)
  end
  def listarCitas
     arreglo = $controlador.listarCitas
     puts "-------------------------------------------------------------------------------"
     puts "\t\t\tLISTADO - CITAS"
     puts "-------------------------------------------------------------------------------"
     puts "codigo   fecha   Medico  Escpecialidad  Paciente  Condicion"
     puts "-------------------------------------------------------------------------------"
     for cita in arreglo 
        if cita.medico.tipoMedico == "E"
           puts "#{cita.codigoCita}  #{cita.fechaCita}  #{cita.medico.nombreMedico} #{cita.medico.nombreespecialidad}  #{cita.paciente.nombrePaciente}  #{cita.paciente.determinarEtapaVida}"
        else
           puts "#{cita.codigoCita}  #{cita.fechaCita}  #{cita.medico.nombreMedico}  General  #{cita.paciente.nombrePaciente}  #{cita.paciente.determinarEtapaVida}" 
        end
     end
     puts "-------------------------------------------------------------------------------" 
  end
  def buscarCitasMedico
    puts "-------------------------------------------------------------------------------"
    puts "\t\t\t\tBUSQUEDA CITAS DEL MEDICO"
    puts "-------------------------------------------------------------------------------"
    print "INGRESE N° DNI DEL MEDICO: "
    dni = gets.chomp.to_s
    medico = $controlador.buscarMedico(dni)
    if medico == nil
       puts "¡No se encontro ningun medico!"
    else
       puts "-------------------------------------------------------------------------------"
       puts "\t\t\t\tDATOS DEL MEDICO"
       puts "-------------------------------------------------------------------------------"
       if medico.tipoMedico == "E"
          puts "#{medico.dniMedico}  #{medico.nombreMedico}  #{medico.apellidosMedico}  #{medico.nombreespecialidad}"
       else
          puts "#{medico.dniMedico}  #{medico.nombreMedico}  #{medico.apellidosMedico}  Medico General"
       end
       puts "-------------------------------------------------------------------------------"     
       puts "Listado de citas:"
       puts "-------------------------------------------------------------------------------"
       arreglo = $controlador.buscarCitasMedico(dni)
       if arreglo.length > 0     
         puts "codigo   fecha    Nom Pac.    Ape Pac.   Sex Pac.   Etap Pac."
         puts "-------------------------------------------------------------------------------"
         for cita in arreglo
           puts "#{cita.codigoCita}  #{cita.fechaCita}  #{cita.paciente.nombrePaciente}  #{cita.paciente.apellidosPaciente}  #{cita.paciente.sexoPaciente}  #{cita.paciente.determinarEtapaVida}"
         end
       else
         puts "¡No se encontraron citas del medico!"  
       end
       puts "-------------------------------------------------------------------------------"
       puts ""
    end
  end
  def detallesCitasMedico 
    puts "-------------------------------------------------------------------------------"
    puts "\t\t\t\tDETALLES CITAS DEL MEDICO"
    puts "-------------------------------------------------------------------------------"
    print "INGRESE N° DNI DEL MEDICO: "
    dni = gets.chomp.to_s
    medico = $controlador.buscarMedico(dni)
    if medico == nil
       puts "¡No se encontro ningun medico!"
    else
       puts "-------------------------------------------------------------------------------"
       puts "\t\t\t\tDATOS DEL MEDICO"
       puts "-------------------------------------------------------------------------------"
       if medico.tipoMedico == "E"
          puts "#{medico.dniMedico}  #{medico.nombreMedico}  #{medico.apellidosMedico}  #{medico.nombreespecialidad}"
       else
          puts "#{medico.dniMedico}  #{medico.nombreMedico}  #{medico.apellidosMedico}  Medico General"
       end
       puts "-------------------------------------------------------------------------------"     
       puts "Detalles de las citas:"
       puts "-------------------------------------------------------------------------------" 
       arreglo = $controlador.detallesCitasMedico(dni)
       if arreglo.length > 0     
         puts "Descripcion       Cantidad"
         puts "Cantidad de Pacientes Infantes     :    #{arreglo[0]}"
         puts "Cantidad de Pacientes Niños        :    #{arreglo[1]}"
         puts "Cantidad de Pacientes Adolescentes :    #{arreglo[2]}"
         puts "Cantidad de Pacientes Jovenes      :    #{arreglo[3]}"
         puts "Cantidad de Pacientes Adultos      :    #{arreglo[4]}"
         puts "Cantidad de Pacientes Ancianos     :    #{arreglo[5]}"
         puts "-------------------------------------------------------------------------------" 
         puts "Total de Citas                     :    #{arreglo[0] + arreglo[1] + arreglo[2] + arreglo[3] + arreglo[4] + arreglo[5]}"
       else
         puts "¡No se encontraron citas del medico!"  
       end 
    end
  end
  def buscarCitasPacientes
    puts "-------------------------------------------------------------------------------"
    puts "\t\t\t\tBUSQUEDA CITAS DEL PACIENTE"
    puts "-------------------------------------------------------------------------------"
    print "INGRESE N° DNI DEL PACIENTE: "
    dni = gets.chomp.to_s
    paciente = $controlador.buscarPaciente(dni)
    if paciente == nil
       puts "¡No se encontro ningun paciente!"
    else
       puts "-------------------------------------------------------------------------------"
       puts "\t\t\t\tDATOS DEL PACIENTE"
       puts "-------------------------------------------------------------------------------"
       puts "#{paciente.codigoPaciente}  #{paciente.nombrePaciente}  #{paciente.apellidosPaciente}  #{paciente.dniPaciente}  #{paciente.edadPaciente}  #{paciente.sexoPaciente}"
       puts "-------------------------------------------------------------------------------"     
       puts "Listado de citas:"
       puts "-------------------------------------------------------------------------------"
       arreglo = $controlador.buscarCitasPaciente(dni)
       if arreglo.length > 0
          puts "codigo   fecha    Nom Med.    Ape Med.  Especialidad"
          puts "-------------------------------------------------------------------------------"
          for cita in arreglo
             if cita.medico.tipoMedico == "E"
                 puts "#{cita.codigoCita}  #{cita.fechaCita}  #{cita.medico.nombreMedico}  #{cita.medico.apellidosMedico}  #{cita.medico.nombreespecialidad}"
             else
                 puts "#{cita.codigoCita}  #{cita.fechaCita}  #{cita.medico.nombreMedico}  #{cita.medico.apellidosMedico}  General"
             end
          end
       else
         puts "¡No se encontraron citas del paciente!"  
       end
    end
  end  
end

vista = Vista.new
adm = Administrador.instance
controlador = Controlador.new(vista,adm)
vista.menuPrincipal(controlador)