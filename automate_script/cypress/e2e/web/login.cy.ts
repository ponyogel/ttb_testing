import { Login } from "./func"

describe('Login', () => {

    const base_url: string = Cypress.env('web').base_url
    beforeEach(() => {
        cy.visit(base_url)
    })

    it('should login successfully', () => {

        const username: string = "tomsmith"
        const password: string = "SuperSecretPassword!"

        Login.loginSuccess({username, password})
        Login.verifyLoginSuccess()
        Login.logoutSuccess()
    })

    it('should login failed - Password incorrect', () => {

        const username: string = "tomsmith"
        const password: string = "Password!"

        Login.loginFailure({username, password})
        Login.verifyLoginFailure({ failedType: "passwordIncorrect" })
    })
    
    it('should login failed - Username incorrect', () => {

        const username: string = "tomholland"
        const password: string = "SuperSecretPassword!"

        Login.loginFailure({username, password})
        Login.verifyLoginFailure({ failedType: "usernameNotfound" })
    })
    
})