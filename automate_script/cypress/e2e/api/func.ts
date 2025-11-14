export class UserProfile {

    static getUserProfileSuccess() {

        const base_url: string = Cypress.env('api').base_url
        
        cy.request({
            method: 'GET',
            url: `${base_url}/users/12`
        }).then((response) => {
            expect(response.status).to.eq(200)
            expect(response.body.data.id).to.eq(12)
            expect(response.body.data.email).to.eq('rachel.howell@reqres.in')
            expect(response.body.data.first_name).to.eq('Rachel')
            expect(response.body.data.last_name).to.eq('Howell')
            expect(response.body.data.avatar).to.eq('https://reqres.in/img/faces/12-image.jpg')
        })
    }

    static getUserProfileNotFound() {

        const base_url: string = Cypress.env('api').base_url

        cy.request({
            method: 'GET',
            url: `${base_url}/users/23`,
            failOnStatusCode: false
        }).then((response) => {
            expect(response.status).to.eq(404)
            expect(response.body).to.be.empty
        })
    }

}