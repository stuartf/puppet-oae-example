#
# User and group resources for OIPP SIS integration
#
class people::oipp-sis {

    include rssh

    group { 'ucd_sis' : gid => '801' }
    user { 'ucd_sis':
        ensure     => present,
        uid        => '801',
        gid        => 'ucd_sis',
        home       => '/home/ucd_sis',
        managehome => true,
        groups     => ['ucd_sis',],
        shell      => '/usr/bin/rssh'
    }
    ssh_authorized_key { 'ucd_sis-pub':
        ensure => present,
        key  => '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',
        type => 'ssh-dss',
        user => 'ucd_sis',
        require => User['ucd_sis'],
    }

    group { 'ucb_sis' : gid => '802' }
    user { 'ucb_sis':
        ensure     => present,
        uid        => '802',
        gid        => 'ucb_sis',
        home       => '/home/ucb_sis',
        managehome => true,
        groups     => ['ucb_sis',],
        shell      => '/usr/bin/rssh'
    }
    ssh_authorized_key { 'ucb_sis-pub':
        ensure => present,
        # TODO supply a vaid key
        key  => 'TODO',
        type => 'ssh-dss',
        user => 'ucb_sis',
        require => User['ucb_sis'],
    }

    group { 'ucm_sis' : gid => '803' }
    user { 'ucm_sis':
        ensure     => present,
        uid        => '803',
        gid        => 'ucm_sis',
        home       => '/home/ucm_sis',
        managehome => true,
        groups     => ['ucm_sis',],
        shell      => '/usr/bin/rssh'
    }
    ssh_authorized_key { 'ucm_sis-pub':
        ensure => present,
        key  => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAtaSgc1yR3TWkJYGMZ9GCeraNbhMIw8dFnS2rKjQ4FOr9dOm7XgNGIQytRt+Mel+JqJSp60OZZM08bK5HHw001At3dNgR7N5M+hN+bhPr7pXgXZfEikMpYqHoZk08d1AiTmATpEPPooiCPeFvWFsTrtPP6IORnJ5hVLOHyAjZ23F1BYOco6zGnj4pd25aMYVnJ3kC+sFrvXk5gK0FzrgQlMdPusqRNulsOUWU1gEa7iO9AxXEXc2xPEzpFHwSlfPNwVvH57y7qhQ8XQ7Gb7GckdjESYABPn2sOroUzwaaeAElnkICYpvDyvUhQ6bhXbmiGWnU+Wd6cjNaKtRVELf+Ww==',
        type => 'ssh-rsa',
        user => 'ucm_sis',
        require => User['ucm_sis'],
    }

    group { 'ucla_sis': gid => '804' }
    user { 'ucla_sis':
        ensure     => present,
        uid        => '804',
        gid        => 'ucla_sis',
        home       => '/home/ucla_sis',
        managehome => true,
        groups     => ['ucla_sis',],
        shell      => '/usr/bin/rssh'
    }
    ssh_authorized_key { 'ucla_sis-pub':
        ensure => present,
        key  => 'AAAAB3NzaC1yc2EAAAABJQAAAQBpmGDSwo88AS1cfftJpROeayvF1zYyvyjoVt1ApcHid3W/Yu+s1FVV0qQgZ05VKiXN/cUz1SLaZxcPUxorWIUrb9wHBNVCfEsbYrUgcie9gWVyQ7qAX9+zYFcWh1CxVC9Djg3QMhxD0YvrDFyMiFLv1iJ3Gw7WR2fqofvBaMRnA3r9d76CN0DsuT2Ghsv1pu1Z4mj4ny6NEuKYGkAVEevwoI75l6XMYAoh51YfQHJBzQG4zHJEGrX32CjsrZmHaa4jyYuS/hD4Z7hl7j2PqqRMDTnYIEM8f22a9rG0rqCM3fSwcyl1kRlF9m5YPHN/vVArvq+E1YCRGm4RawaAhIA3',
        type => 'ssh-rsa',
        user => 'ucla_sis',
        require => User['ucla_sis'],
    }
}
