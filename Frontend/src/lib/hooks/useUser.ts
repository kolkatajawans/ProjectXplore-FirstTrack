import axios from 'axios';
import { domain } from '../domain';
import { useEffect, useState } from 'react';
import { useAtom } from 'jotai';
import { userAtom } from '../atoms/userAtom';

function useAuth() {
  const [, setUserid] = useAtom(userAtom);
  const [authenticated, setIsAuthenticated] = useState(false);
  const [loading, setIsLoading] = useState(true);

  useEffect(() => {
    const refreshAccesstoken = async () => {
      try {
        const response = await axios.get(`${domain}/api/v1/users/refresh-token`, {
          withCredentials: true,
        });
        if (response.status === 200) {
          const { user } = response.data.data;
          setIsAuthenticated(true);
          setIsLoading(false);
          setUserid(user.id);
        }
      } catch (error) {
        console.error(error);
        setIsLoading(false);
      }
    };

    const checkAuth = async () => {
      try {
        const response = await axios.get(`${domain}/api/v1/users/validate-token`, {
          withCredentials: true,
        });
        if (response.status === 200) {
          if (response.data.data.user.id) {
            const userid = response.data.data.user.id;
            setIsAuthenticated(true);
            setUserid(userid);
            setIsLoading(false);
          }
        } else {
          refreshAccesstoken();
        }
      } catch (error) {
        console.error(error);
        setIsLoading(false);
      }
    };

    checkAuth();
  }, [domain]);

  return { loading, authenticated };
}

export default useAuth;