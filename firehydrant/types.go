package firehydrant

import "time"

// Actor represents an actor doing things in the FireHydrant API
type Actor struct {
	ID    string `json:"id"`
	Name  string `json:"name"`
	Email string `json:"email"`
	Type  string `json:"type"`
}

// PingResponse is the response the ping endpoint gives from FireHydrant
// URL: GET https://api.firehydrant.io/v1/ping
type PingResponse struct {
	Actor Actor `json:"actor"`
}

// CreateServiceRequest is the payload for creating a service
// URL: POST https://api.firehydrant.io/v1/services
type CreateServiceRequest struct {
	Name        string `json:"name"`
	Description string `json:"description"`
}

// UpdateServiceRequest is the payload for updating a service
// URL: PATCH https://api.firehydrant.io/v1/services/{id}
type UpdateServiceRequest struct {
	Name        string `json:"name,omitempty"`
	Description string `json:"description,omitempty"`
}

// ServiceResponse is the payload for retrieving a service
// URL: GET https://api.firehydrant.io/v1/services/{id}
type ServiceResponse struct {
	ID          string            `json:"id"`
	Name        string            `json:"name"`
	Description string            `json:"description"`
	Slug        string            `json:"slug"`
	CreatedAt   time.Time         `json:"created_at"`
	UpdatedAt   time.Time         `json:"updated_at"`
	Labels      map[string]string `json:"labels"`
}
