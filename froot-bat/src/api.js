import axios from 'axios';

const BASE_URL = 'http://localhost:3000'; // This is the URL of the Rails API

export const login = async (email, password) => {
  const response = await axios.post(`${BASE_URL}/login`, { email, password });
  return response.data;
};

export const logout = async () => {
  const response = await axios.delete(`${BASE_URL}/logout`);
  return response.data;
};


