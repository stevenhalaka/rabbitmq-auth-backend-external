%% The contents of this file are subject to the Mozilla Public License
%% Version 1.1 (the "License"); you may not use this file except in
%% compliance with the License. You may obtain a copy of the License
%% at http://www.mozilla.org/MPL/
%%
%% Software distributed under the License is distributed on an "AS IS"
%% basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
%% the License for the specific language governing rights and
%% limitations under the License.
%%
%% The Original Code is RabbitMQ HTTP authentication.
%%
%% The Initial Developer of the Original Code is VMware, Inc.
%% Copyright (c) 2007-2011 VMware, Inc.  All rights reserved.
%%

-module(rabbit_auth_backend_external).

-include_lib("rabbit_common/include/rabbit.hrl").
-behaviour(rabbit_auth_backend).

-export([description/0]).
-export([check_user_login/2, check_vhost_access/2, check_resource_access/3]).

%%--------------------------------------------------------------------

description() ->
    [{name, <<"EXTERNAL_AUTH">>},
     {description, <<"EXTERNAL authorization">>}].

%%--------------------------------------------------------------------

check_user_login(Username, AuthProps) ->
		{ok, #user{
			username     = Username,
			tags         = none,
			auth_backend = ?MODULE,
			impl         = none}}.

check_vhost_access(#user{username = Username}, VHost) ->
	true.

check_resource_access(#user{username = Username},
                      #resource{virtual_host = VHost, kind = Type, name = Name},
                      Permission) ->
	true.
