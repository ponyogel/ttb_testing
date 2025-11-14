export const resource: Resource = {
    elementLocator: {
        loginPage: {
            username: '#username',
            password: '#password',
            loginButton: 'button[type="submit"]'
        },
        homePage: {
            alert: '#flash-messages',
            logoutButton: '.button.secondary.radius'
        },
        
    },
    dataValidate: {
        loginSuccess: {
            alertText: 'You logged into a secure area!'
        },
        loginFail: {
            alertText: {
                username: 'Your username is invalid!',
                password: 'Your password is invalid!'
            }
        },
        logoutSuccess: {
            alertText: 'You logged out of the secure area!'
        }
    }


}

interface Resource{
    elementLocator: {
        loginPage: {
            username: string,
            password: string,
            loginButton: string
        }
        homePage: {
            alert: string,
            logoutButton: string
        }
    
    }
    dataValidate: {
        loginSuccess: {
            alertText: string
        },
        loginFail: {
            alertText: {
                username: string,
                password: string
            }
        },
        logoutSuccess: {
            alertText: string
        }
    }
}