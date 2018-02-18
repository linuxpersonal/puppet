define sshservice::authkeys (
  $user = undef,
  $key = undef,
){

  ssh_authorized_key { $name:
        user        => $user,
        type        => 'rsa',
        key         => $key,
    }

}

