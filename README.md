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
                            
      JSON returned: {user: {id: integer,
                          username: string,
                          email: string,
                          created_at: timestamp,
                          updated_at: timestamp,
                          provider: string,
                          uid: string,
                          first_name: string,
                          last_name: string,
                          authentication_token: string},
                      profile: {location: string,
                              about_me: string,
                              vehicle_year: integer,
                              vehicle_make: string,
                              vehicle_model: string,
                              vehicle_link: string,
                              level: string},
                      stat_tracker: {route_total: string,
                                    comment_total: integer,
                                    rating_total: integer,
                                    checkin_total: integer,
                                    points: integer,
                                    user_id: integer}
                                    
                                    }, status: 200
                           

_____
  * To edit a user's email or password

  PATCH /users/edit
  
      JSON requested: {user: {email: string AND/OR
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
                              
      JSON returned: {user: {id: integer,
                          username: string,
                          email: string,
                          created_at: timestamp,
                          updated_at: timestamp,
                          provider: string,
                          uid: string,
                          first_name: string,
                          last_name: string,
                          authentication_token: string},
                      profile: {location: string,
                              about_me: string,
                              vehicle_year: integer,
                              vehicle_make: string,
                              vehicle_model: string,
                              vehicle_link: string,
                              level: string},
                      stat_tracker: {route_total: string,
                                    comment_total: integer,
                                    rating_total: integer,
                                    checkin_total: integer,
                                    points: integer,
                                    user_id: integer}
                                    
                                    }, status: 200
_____                             
  * To view a user's profile

  GET /profiles/:user_id
  
      JSON returned: {user: {id: integer,
                          username: string,
                          email: string,
                          created_at: timestamp,
                          updated_at: timestamp,
                          provider: string,
                          uid: string,
                          first_name: string,
                          last_name: string,
                          authentication_token: string},
                      profile: {location: string,
                              about_me: string,
                              vehicle_year: integer,
                              vehicle_make: string,
                              vehicle_model: string,
                              vehicle_link: string,
                              level: string},
                      stat_tracker: {route_total: string,
                                    comment_total: integer,
                                    rating_total: integer,
                                    checkin_total: integer,
                                    points: integer,
                                    user_id: integer}
                                    
                                    }, status: 200 
                              

Routes
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
                              twist_rating: float,
                              traffic_rating: float,
                              quality_rating: float}
                              }
                            
_____
* To get a user's routes (only works for signed-in user)

  GET /routes
  
      JSON returned: {routes: [
                              {id: integer,
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
                              twist_rating: float,
                              traffic_rating: float,
                              quality_rating: float},
                              
                              {id: integer,
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
                              twist_rating: float,
                              traffic_rating: float,
                              quality_rating: float}]
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
                              twist_rating: float,
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
                              twist_rating: float,
                              traffic_rating: float,
                              quality_rating: float}
                              }
-----
* To search for routes by distance

  POST /routes/search
  
      JSON requested: {search: {current_lat: decimal,
                                current_long: decimal,
                                search_radius: integer}
                                }, status: 200
                                
      JSON returned: {routes: [
                            {
                              {id: integer,
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
                              twist_rating: float,
                              traffic_rating: float,
                              quality_rating: float}
                            },
                            {  
                              {id: integer,
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
                              twist_rating: float,
                              traffic_rating: float,
                              quality_rating: float}
                            }
                          ]
                        }
