ColdBox 4 Security Module
================

This security module includes User/ORM, Social Login, & Sign-up form.

Setup & Installation
---------------------

box install nsg-module-security

1.  Create a datasource and import the /setup/setup.sql into your locate database for quick setup.
2.  Drop the models in /setup/models/*.cfc into your primary model folder.
3.  Next add the AOP decorator "secure" to any handler or action to enforce security.

####Example Handler
    
    component {
        public function index(event,rc,prc) secure {
            // handler code
        }
    }

####Add the following structure to Coldbox.cfc

    security = {
        allowAccountCreation        = true,
        maxLoginFailureAttempts     = 5
    }
