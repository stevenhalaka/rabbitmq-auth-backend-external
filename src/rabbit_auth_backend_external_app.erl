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

-module(rabbit_auth_backend_external_app).

-behaviour(application).
-export([start/2, stop/1]).

-behaviour(supervisor).
-export([init/1]).

start(_Type, _StartArgs) ->
    supervisor:start_link({local,?MODULE},?MODULE,[]).

stop(_State) ->
    ok.

%%----------------------------------------------------------------------------

init([]) ->
    {ok, {{one_for_one,3,10},[]}}.
