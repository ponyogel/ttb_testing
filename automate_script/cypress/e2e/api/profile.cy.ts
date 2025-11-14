import { UserProfile } from "./func"

describe('Get User Profile', () => {

    // Note ไม่สามารถ run test ได้เนื่องจาก ยิง api แล้วได้ response "error": "Missing API key"

    it('Get User Profile - Success', () => {
        UserProfile.getUserProfileSuccess()
    })

    it('Get User Profile - Fail', () => {
        UserProfile.getUserProfileNotFound()
    })
})
