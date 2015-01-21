class baseos::service inherits baseos   {        
	#Array de servicios para deshabilitar
        $service_off = [ "cups", "portmap", "nfs-kernel-server", "nfslock", "postfix"  ]
        #Servicios deshabilitados       
        service { $service_off:
                ensure => "stopped",
                enable => false,
        }
        #Array de servicios para habilitar
        $service_on = [ "puppet" ]
        #Servicios habilitados  
        service { $service_on:
                ensure => "running",
                enable => true,
        }

}
