README
=====

* Ruby version
  2.1.5
* Rails version
  4.2.0


ROUTING
=====

Users
-----
  
* To register a new user

  POST /users
  
    JSON requested: {user: {email: string,
                            password: string,
                            username: string}
                            }
                            
    JSON returned: {user: {email: string,
                           username: string,
                           id: integer,
                           created_at: timestamp,
                           updated_at: timestamp,
                           provider: string,
                           uid: string,
                           first_name: string,
                           last_name: string,
                           authentication_token: string}
                           }, status 200
                           
                           
* To log in a user

  POST /users/login
  
    JSON requested: {user: {email: string,
                            password: string}
                            }
    
    JSON returned: {user: {id: 5,
                          username: string,
                          email: string,
                          created_at: timestamp,
                          updated_at: timestamp,
                          provider: string,
                          uid: string,
                          first_name: string,
                          last_name: string,
                          authentication_token: string}
                          }, status 200
                            
* To destroy a user

  GET /users/destroy
  
    JSON returned: {user: nil}, status 200
    
    
    
Profiles
-----

* To edit a user's profile

  PATCH /profiles
  
    JSON requested: {profile: {location: string,
                              about_me: string,
                              vehicle_year: integer,
                              vehicle_make: string,
                              vehicle_model: string,
                              vehicle_link: string}
                              }
    JSON returned: {profile: {location: string,
                              about_me: string,
                              vehicle_year: integer,
                              vehicle_make: string,
                              vehicle_model: string,
                              vehicle_link: string}
                              }, status: 200
                              
* To view a user's profile

  GET /profiles
  
    JSON returned: {profile: {location: string,
                              about_me: string,
                              vehicle_year: integer,
                              vehicle_make: string,
                              vehicle_model: string,
                              vehicle_link: string}
                              }, status: 200  
                              

                           
                          





Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
