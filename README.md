# Instagram Clone with Rails and Angular

## API Documentation

### [Tweets](#tweets)
| Method | Path | Description |
|---|---|---|
| GET | /photos | List all photos |
| GET | /users/{username}/photos | List all photos of a specific user |
| GET | /photos/{id} | Retrieve a tweet |
| POST | /photos | Create a new tweet (require user authentication) |
| DELETE | /photos/{id} | Delete a Tweet (require user authentication) |

### [Users](#users)
| Method | Path | Description |
|---|---|---|
| GET | /users | List all users |
| GET | /users/{username} | Retrieve a user |
| POST | /users | Create a new user |
| POST | /users/sign_in | Create a new user |

### [Sessions](#sessions)
| Method | Path | Description |
|---|---|---|
| POST | /sessions | Create a new session |
| GET | /authenticated | Check if you are authenticated |
| DELETE | /sessions | Delete a Session (Logout) |