import axios from 'axios';
import {getCookie} from 'cookies-next';
import React from "react";
import { domain } from '../domain';


async function useUser() {
    try {
      const response = await axios.get(`${domain}/api/v1/users/validateUser`, {
        withCredentials: true,
      });
      const data = response.data;
      return data;
    } catch (error) {
      console.error(error);
      return null; 
    }
  }
  
  export default useUser;