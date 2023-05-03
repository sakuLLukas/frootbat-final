import React, { useState } from 'react';
import { login } from './api';

const LoginForm = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const handleEmailChange = (event) => {
    setEmail(event.target.value);
  };

  const handlePasswordChange = (event) => {
    setPassword(event.target.value);
  };

  const handleSubmit = async (event) => {
    event.preventDefault();
    try {
      const user = await login(email, password);
      console.log(user); // Do something with the user object
    } catch (error) {
      console.error(error);
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <label htmlFor="email">Email</label>
      <input type="email" id="email" value={email} onChange={handleEmailChange} />

      <label htmlFor="password">Password</label>
      <input type="password" id="password" value={password} onChange={handlePasswordChange} />

      <button type="submit">Login</button>
    </form>
  );
};

export default LoginForm;
