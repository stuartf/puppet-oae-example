#
# Use this class to configure a specific OAE cluster.
# In your nodes file refer to these variables as $localconfig::variable_name.
#
class localconfig {
    
    Class['localconfig::hosts'] -> Class['localconfig']

    ###########################################################################
    # OS
    $user    = 'rsmart'
    $group   = 'rsmart'
    $uid     = 500
    $gid     = 500
    $basedir = '/home/rsmart/sakaioae'

    ###########################################################################
    # Nodes
    
    $app_server1 = '10.51.11.100'
    $app_server2 = '10.51.11.101'
    $nfs_server  = '10.51.11.90'
    $db_server   = '10.51.11.70'
    $solr_master = '10.51.11.30'
    $solr_slave1 = '10.51.11.31'

	# prod-cle
    $cle_server1  = '10.51.10.16'
    $cle_server2  = '10.51.10.17'

    ###########################################################################
    # Database setup
    $db          = 'nak'
    $db_url      = "jdbc:postgresql://${db_server}/${db}?charSet\\=UTF-8"
    $db_driver   = 'org.postgresql.Driver'
    $db_user     = 'nakamura'
    $db_password = 'ironchef'

    ###########################################################################
    # Content body storage
    $nfs_share   = '/export/files-academic'
    $nfs_mountpoint = '/files-academic'
    $nfs_options = '_netdev,rw,rsize=8192,wsize=8192'

    $storedir    = "/files-academic/store"
    ###########################################################################
    # Git (Preview processor)
    $nakamura_git = "http://github.com/rsmart/nakamura.git"
    $nakamura_tag = "acad-1.1.0-M1-20120130"

    ###########################################################################
    # Apache load balancer
    # $http_name = 'cole.uconline.edu'
    $http_name           = 'oipp-prod2.academic.rsmart.com'
    $http_name_untrusted = 'oipp-content.academic.rsmart.com'
    $apache_lb_members           = [ "${app_server1}:8080", "${app_server2}:8080" ]
    $apache_lb_members_untrusted = [ "${app_server1}:8082", "${app_server2}:8082" ]
    $apache_lb_params            = ["retry=20", "min=3", "flushpackets=auto", "max=250", "loadfactor=100", "timeout=60"]

    $mock_cle_content = true
    $apache_cle_lb_members = [ "${cle_server1}:8009 route=OIPP-CLE1", "${cle_server2}:8009 route=OIPP-CLE2" ]
    $apache_cle_location_match = "^/(xsl-portal.*|access.*|courier.*|dav.*|direct.*|imsblti.*|library.*|messageforums-tool.*|osp-common-tool.*|polls-tool.*|portal.*|profile-tool.*|profile2-tool.*|sakai.*|samigo-app.*|scheduler-tool.*|rsmart-customizer-tool.*|oauth-tool.*|emailtemplateservice-tool.*|sitestats-tool.*|rsmart-support-tool.*|mailsender-tool.*|tool.css|portool_base.css)" 
    $cle_dav_server0 = '10.52.10.19'

    ###########################################################################
    # App servers
    $jarsource     = '/home/rsmart/com.rsmart.academic.app.oipp-1.1.1-SNAPSHOT.jar'
    $jarfile       = 'com.rsmart.academic.app.oipp-1.1.1-SNAPSHOT.jar'
    $java          = '/usr/java/jdk1.6.0_30/bin/java'
    $javamemorymax = '5g'
    $javamemorymin = '5g'
    $javapermsize  = '256m'

    $admin_password = 'admin'

    # These hosts can access /system/console
    $oae_admin_hosts = ['72.44.192.164', ]

    # oae server protection service
    $serverprotectsec = 'M9LjpkmNioYEZD81BBffC4QzRAiHpJ8'
    $sps_disabled = false

    # ehcache
    $ehcache_tcp_port = '40001'
    $ehcache_remote_object_port = '40002'

    # solr
    $solr_remoteurl = "http://${solr_master}:8080/solr"
    # $solr_queryurls = "http://${solr_master}:8080/solr|http://${solr_slave1}:8080/solr"
    $solr_queryurls = "http://${solr_master}:8080/solr"

    #CLE
    $basiclti_secret = "C7beFutror7iSd"
    $basiclti_key = "AcademicRsmartCom"

    $tomcat_user    = 'admin'
    $tomcat_password = 'pulp134@rain'

    # outgoing email
    $reply_as_address = 'noreply@rsmart.com'
    $reply_as_name = 'rSmart'
}
