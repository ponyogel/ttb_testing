import { resource } from "./data"

const locator = resource.elementLocator
const data = resource.dataValidate

function loginSuccess(username: string, password: string) {
    cy.get(locator.loginPage.username).type(username)
    cy.get(locator.loginPage.password).type(password)
    cy.get(locator.loginPage.loginButton).click()
}

function loginFailure(username: string, password: string) {
    cy.get(locator.loginPage.username).type(username)
    cy.get(locator.loginPage.password).type(password)
    cy.get(locator.loginPage.loginButton).click()
}

function verifyLoginSuccess() {
    cy.get(locator.homePage.alert).invoke('text').then((text) => {
        expect(text.trim()).to.contain(data.loginSuccess.alertText)
    })
}

function verifyLoginFailed(failedType: string) {
    switch (failedType) {
        case 'passwordIncorrect':
            cy.get(locator.homePage.alert).invoke('text').then((text) => {
                expect(text.trim()).to.contain(data.loginFail.alertText.password)
            })
            break;
        case 'usernameNotfound':
            cy.get(locator.homePage.alert).invoke('text').then((text) => {
                expect(text.trim()).to.contain(data.loginFail.alertText.username)
            })
                break;
    }
}

function logoutSuccess() {
    cy.get(locator.homePage.logoutButton).click()
}

function verifyLogoutSuccess() {
    cy.get(locator.homePage.alert).invoke('text').then((text) => {
        expect(text.trim()).to.contain(data.logoutSuccess.alertText)
    })
}


export class Login {

    static loginSuccess(args: { username: string, password: string }) {
        loginSuccess(args.username, args.password)
    }

    static loginFailure(args: { username: string, password: string }) {
        loginFailure(args.username, args.password)
    }

    static verifyLoginSuccess() {
        verifyLoginSuccess()
    }

    static verifyLoginFailure(args: { failedType: string }) {
        verifyLoginFailed(args.failedType)


    }

    static logoutSuccess() {
        logoutSuccess()
        verifyLogoutSuccess()
    }


}