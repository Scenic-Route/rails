README
=====

* Ruby version
  2.1.5
* Rails version
  4.2.0


ROUTING
=====

* Users: https://github.com/Scenic-Route/rails/blob/master/README.md#users
* Profiles: https://github.com/Scenic-Route/rails/blob/master/README.md#profiles
* Routes: https://github.com/Scenic-Route/rails/blob/master/README.md#routes
* Ratings: https://github.com/Scenic-Route/rails/blob/master/README.md#ratings
* Check-ins: https://github.com/Scenic-Route/rails/blob/master/README.md#check-ins
* Favorites: https://github.com/Scenic-Route/rails/blob/master/README.md#favorites
* Interest Points: https://github.com/Scenic-Route/rails/blob/master/README.md#interest-points

Users
-----
  
* To register a new user

  POST /users
  
      JSON requested: {user: {email: string, (required)
                            password: string, (required)
                            username: string, (required)
                            first_name: string,
                            last_name: string}
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
                           

-----
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
                           

-----                          
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
                          
-----                           
  * To destroy a user

  GET /users/destroy
  
      JSON returned: {user: nil}, status 200
      
-----  
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

_____
Profiles
=====

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
                                    
-----                             
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
                      stat_tracker: {route_total: integer,
                                    comment_total: integer,
                                    rating_total: integer,
                                    checkin_total: integer,
                                    points: integer,
                                    user_id: integer}
                                    
                                    }, status: 200 
                              

_____
Routes
=====

* To create a new route

  POST /routes
  
      JSON requested: {route: {latitude: decimal, (required)
                              longitude: decimal, (required)
                              end_lat: decimal, (required)
                              end_long: decimal, (required)
                              user_id: integer, (required)
                              name: string, (required)
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
                              quality_rating: float,
                              scenery_rating: float}
                              }
                            
-----
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
                              quality_rating: float,
                              scenery_rating: float},
                              
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
                              quality_rating: float,
                              scenery_rating: float}]
                        }
                        
                        
-----                             
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
                              quality_rating: float,
                              scenery_rating: float}
                              }
                              
-----
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
                              quality_rating: float,
                              scenery_rating: float}
                              }
                              
-----
* To search for routes by distance

  POST /routes/search
  
      JSON requested: {search: {current_lat: decimal, (required)
                                current_long: decimal, (required)
                                search_radius: integer (required)
                                }
                          }, status: 200
                                
      JSON returned: {routes: [
                            {
                              {id: integer,
                              latitude: decimal,
                              longitude: decimal,
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
                              quality_rating: float,
                              scenery_rating: float,
                              distance: float,
                              bearing: float}
                            },
                            {  
                              {id: integer,
                              latitude: decimal,
                              longitude: decimal,
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
                              quality_rating: float,
                              scenery_rating: float,
                              distance: float,
                              bearing: float}
                            }
                          ]
                        }, status: 200
                        
-----
* To get all of a route's ratings

  GET /routes/:id/ratings
  
      JSON returned: {ratings: [
                                {id: integer,
                                user_id: integer,
                                route_id: integer,
                                twist_rating: integer,
                                quality_rating: integer,
                                traffic_rating: integer,
                                scenery_rating: integer,
                                sport: boolean,
                                scenic: boolean,
                                comments: string
                                },
                                {id: integer,
                                user_id: integer,
                                route_id: integer,
                                twist_rating: integer,
                                quality_rating: integer,
                                traffic_rating: integer,
                                scenery_rating: integer,
                                sport: boolean,
                                scenic: boolean,
                                comments: string}
                              ]
                          }, status: 200

-----
* To get all of a route's waypoints

  GET /routes/:id/waypoints
  
      JSON returned: {waypoints: [
                                {id: integer,
                                user_id: integer,
                                route_id: integer,
                                latitude: decimal,
                                longitude: decimal,
                                comments: string,
                                photo: file
                                },
                                {id: integer,
                                user_id: integer,
                                route_id: integer,
                                latitude: decimal,
                                longitude: decimal,
                                comments: string,
                                photo: file
                                }
                              ]
                          }, status: 200
                        
-----
* To get all of a route's comments

  GET /routes/:id/comments
  
      JSON returned: {comments: [
                                {id: integer,
                                user_id: integer,
                                user_name: string,
                                route_id: integer,
                                content: text
                                },
                                {id: integer,
                                user_id: integer,
                                user_name: string,
                                route_id: integer,
                                content: text
                                }
                              ]
                          }, status: 200
                        
-----
RATINGS
=====

* To post a new rating

  POST /ratings
  
      JSON requested: {rating: {user_id: integer,           (required)
                                route_id: integer,          (required)
                                twist_rating: integer,      (required)
                                quality_rating: integer,    (required)
                                traffic_rating: integer,    (required)
                                scenery_rating: integer,    (required)
                                sport: boolean,             (required)
                                scenic: boolean,            (required)
                                comments: string
                              }
                          }
                          
      JSON returned: {rating: {id: integer,
                              user_id: integer,
                              route_id: integer,
                              twist_rating: integer,
                              quality_rating: integer,
                              traffic_rating: integer,
                              scenery_rating: integer,
                              sport: boolean,
                              scenic: boolean,
                              comments: string
                                }, status: 201
                                

-----
* To edit a rating

  PATCH /ratings/:id
  
      JSON requested: {rating: {twist_rating: integer,     
                                quality_rating: integer,  
                                traffic_rating: integer,  
                                scenery_rating: integer, 
                                sport: boolean,          
                                scenic: boolean,         
                                comments: string
                              }
                          }
                          
      JSON returned: {rating: {id: integer,
                              user_id: integer,
                              route_id: integer,
                              twist_rating: integer,
                              quality_rating: integer,
                              traffic_rating: integer,
                              scenery_rating: integer,
                              sport: boolean,
                              scenic: boolean,
                              comments: string
                                }, status: 200

-----
* To delete a rating

  DELETE /ratings/:id
  
      JSON returned: {rating: nil}, status: 200
      
      
_____
CHECK-INS
=====

* To post a new checkin

  POST /checkins
      
      JSON requested: {checkin: {route_id: integer,       (required)
                                user_id: integer,         (required)
                                latitude: decimal,        (required)
                                longitude: decimal        (required)
                              }
                      }
                      
                      
              IF WITHIN RANGE:
      JSON returned: {checkin: nil}, status: 200
              ELSE:
      JSON returned: {error: "You're not close enough to the route to check in!"}, status: 422
    

_____
FAVORITES
=====

* To post a new favorite

  POST /favorites
  
      JSON requested: {favorite: {route_id: integer,      (required)
                                  user_id: integer,       (required)
                                  favorite_name: string   (required)
                                  }
                                }
      
      JSON returned: {favorite: {route_id: integer,
                                 user_id: integer,
                                 favorite_name: string
                                }, status: 200
                              }
                              

* To view your own favorites

  GET /favorites
      
      JSON returned: {favorites: [
                                  {id: integer,
                                   route_id: integer,
                                   user_id: integer,
                                   favorite_name: string
                                  },
                                  {id: integer,
                                   route_id: integer,
                                   user_id: integer,
                                   favorite_name: string
                                  }
                                 ]
                              }, status: 200
                              
_____
INTEREST POINTS
=====

* To post an interest point

  POST /interest_points
  
      JSON requested: {interest_point: {comment: string,
                                        route_id: integer,
                                        hazard: boolean,        (user MUST choose 1 and only 1)
                                        police: boolean,        (user MUST choose 1 and only 1)
                                        view: boolean,          (user MUST choose 1 and only 1)
                                        latitude: decimal,
                                        longitude: decimal
                                      }
                                    }
            
      JSON returned: {interest_point: { id: integer,
                                        comment: string,
                                        route_id: integer,
                                        user_id: integer,
                                        hazard: boolean,
                                        police: boolean, 
                                        view: boolean,     
                                        latitude: decimal,
                                        longitude: decimal
                                      }
                                    }, status: 200
                                    
* To get all of a route's interest points

  GET /interest_points/:id
  
      JSON returned: {interest_points: [
                                      { id: integer,
                                        comment: string,
                                        route_id: integer,
                                        user_id: integer,
                                        hazard: boolean,
                                        police: boolean, 
                                        view: boolean,     
                                        latitude: decimal,
                                        longitude: decimal
                                      },
                                      { id: integer,
                                        comment: string,
                                        route_id: integer,
                                        user_id: integer,
                                        hazard: boolean,
                                        police: boolean, 
                                        view: boolean,     
                                        latitude: decimal,
                                        longitude: decimal
                                      }
                                      ]
                                    }, status: 200
                                
                                
