class base::params {
        case $::osfamily {
                'RedHat': { $ssh_name = 'sshd'}
                'Debian': { $ssh_name = 'ssh'}
                #default: { Warning('OS not supported by puppet module SSH')}
                default: { fail('OS not supported by puppet module SSH')}
        }

	#$ssh_name = 'sshd'

        #$ssh_name = $osfamily ? {
        #'RedHat' => 'sshd',
        #'Debian' => 'ssh',
        #default => 'value',
        #}

}
