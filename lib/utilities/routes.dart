const baseUrl = 'http://10.0.2.2:3000';

const authBase = baseUrl + '/api/auth';
const itemBase = baseUrl + '/api/item';
const orderBase = baseUrl + '/api/order';
const bookBase = baseUrl + '/api/book';
const userBase = baseUrl + '/api/user';

//ping route

const pingServer = baseUrl + '/api/ping';
//Auth Routes
const login = authBase + '/login';
const signUp = authBase + '/signUp';
const forgotPassword = authBase + '/forgotPassword';
const changePassword = authBase + '/changePassword';
const addPasswordToUser = authBase + '/addPasswordUser';
const thirdParty = authBase + '/thirdParty';
const logout = authBase + '/logout';

//Item Route

//Order Routes

//Book Routes

//User Routes
const editUser = userBase + '/patch';
const updateInProgress = userBase + '/patch/updateInProgress';
const removeFromFav = userBase + '/patch/removeFromFav';
const addToFav = userBase + '/patch/addToFav';
