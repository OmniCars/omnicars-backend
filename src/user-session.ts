export class UserSession {
    id: number
    role: string

    constructor(id: number, role: string) {
        this.id = id;
        this.role = role;
    }
}