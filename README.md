# Overview

RabbitMQ example plugin to authorize the user authenticated by rabbitmq_auth_mechanism_ssl.

# Config

rabbitmq.config:

	[
  	{rabbit, [
     	{ssl_listeners, [5671]},
     	{ssl_options, [{cacertfile,"/path/to/cacert.pem"},
                    	{certfile,"/path/to/cert.pem"},
                    	{keyfile,"/path/to/key.pem"},
                    	{verify,verify_peer},
                    	{fail_if_no_peer_cert,true}]},
    	{ssl_cert_login_from, distinguished_name},
    	{auth_mechanisms,['EXTERNAL,'PLAIN','AMQPLAIN']},
    	{auth_backends, [rabbit_auth_backend_internal, rabbit_auth_backend_external]}
   	]}
	].

enabled_plugins:

	[rabbitmq_auth_mechanism_ssl,rabbitmq_auth_backend_external]
