### models 
[X] Gyms
[X] Memberships (join table)
[X] Clients

### routes
- Gyms: 
[X] GET to /gyms/:id, gym#show
[X] DELETE to /gyms/:id, gym#destroy
BONUS
[X] GET to /gyms, gym#index
[X] POST to /gyms, gym#create

- Memberships: 
[X] POST to /memberships, membership#create

- Clients: 
[X]GET to /clients/:id, client#show 
[X] client#show => include total amount for all memberships (bonus)
BONUS
[X] GET to /clients, client#index
[X] POST to /clients, client#create