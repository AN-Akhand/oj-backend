class User{
    handle;
    name;
    pass;
    join_date;
    last_login;
    global_rating;
    email;
    constructor(handle, name, pass, join_date, last_login, global_rating, email){
        this.handle = handle;
        this.name = name;
        this.password = pass;
        this.join_date = join_date;
        this.last_login = last_login;
        this.global_rating = global_rating;
        this.email = email;
    }

}
export default User