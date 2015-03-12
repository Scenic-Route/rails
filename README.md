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
  
  *To register a new user

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
                           

_____
  * To edit a user's email or password

  PATCH /users/edit
  
      JSON requested: {user: {email: string AND/OR
                              password: string}
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
                           

_____                           
  * To log in a user


  POST /users/login
  
      JSON requested: {user: {email: string,
                            password: string}
                            }
    
      JSON returned: {user: {id: integer,
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
_____                            
  * To destroy a user

  GET /users/destroy
  
      JSON returned: {user: nil}, status 200
_____    
  * To look at a user's information

  GET /users
  
      JSON returned: {user: {id: integer,
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
_____                             
  * To view a user's profile

  GET /profiles
  
      JSON returned: {profile: {location: string,
                              about_me: string,
                              vehicle_year: integer,
                              vehicle_make: string,
                              vehicle_model: string,
                              vehicle_link: string}
                              }, status: 200  
                              

ROUTES
=====

* To create a new route

  POST /routes
  
      JSON requested: {route: {start_lat: decimal,
                              start_long: decimal,
                              end_lat: decimal,
                              end_long: decimal,
                              user_id: integer,
                              name: string,
                              high_limit: integer,
                              low_limit: integer}
                              
      JSON returned: {route: {id: integer,
                              start_lat: decimal,
                              start_long: decimal,
                              end_lat: decimal,
                              end_long: decimal,
                              user_id: integer,
                              name: string,
                              high_limit: integer,
                              low_limit: integer,
                              popularity: integer,
                              created_at: timestamp,
                              updated_at: timestamp,
                              police_rating: float,
                              traffic_rating: float,
                              quality_rating: float}
                              }
                              
_____                              
* To view a single route's information

  GET /routes/:id
    
      JSON returned: {route: {id: integer,
                              start_lat: decimal,
                              start_long: decimal,
                              end_lat: decimal,
                              end_long: decimal,
                              user_id: integer,
                              name: string,
                              high_limit: integer,
                              low_limit: integer,
                              popularity: integer,
                              created_at: timestamp,
                              updated_at: timestamp,
                              police_rating: float,
                              traffic_rating: float,
                              quality_rating: float}
                              }
                              
_____  
* To edit a route

  PATCH /routes/:id
  
      JSON requested: {route: {start_lat: decimal,
                              start_long: decimal,
                              end_lat: decimal,
                              end_long: decimal,
                              user_id: integer,
                              name: string,
                              high_limit: integer,
                              low_limit: integer}
                              
      JSON returned: {route: {id: integer,
                              start_lat: decimal,
                              start_long: decimal,
                              end_lat: decimal,
                              end_long: decimal,
                              user_id: integer,
                              name: string,
                              high_limit: integer,
                              low_limit: integer,
                              popularity: integer,
                              created_at: timestamp,
                              updated_at: timestamp,
                              police_rating: float,
                              traffic_rating: float,
                              quality_rating: float}
                              }
                           
                          
