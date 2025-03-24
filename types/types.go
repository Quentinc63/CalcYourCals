package types

import "time"

type UserStore interface {
	GetUserByEmail(email string) (*User, error)
	GetUserByID(id int) (*User, error)
	CreateUser(User) error
}

func GetUserByEmail(email string) (*User, error) {
	return nil, nil
}

type User struct {
	ID        int       `json:"id"`
	Email     string    `json:"email"`
	Password  string    `json:"password"`
	FirstName string    `json:"firstName"`
	LastName  string    `json:"lastName"`
	Height    int       `json:"height"`
	Weight    int       `json:"weight"`
	Age       int       `json:"age"`
	Gender    string    `json:"gender"`
	Bmr       int       `json:"bmr"`
	Public    bool      `json:"public"`
	CreatedAt time.Time `json:"created_at"`
}

type RegisterUserPayload struct {
	Email     string `json:"email"`
	Password  string `json:"password"`
	FirstName string `json:"firstName"`
	LastName  string `json:"lastName"`
	Height    int    `json:"height"`
	Weight    int    `json:"weight"`
	Age       int    `json:"age"`
	Gender    string `json:"gender"`
	Bmr       int    `json:"bmr"`
	Public    bool   `json:"public"`
}
