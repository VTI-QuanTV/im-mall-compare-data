import axios, { AxiosRequestConfig } from 'axios';

export class AxiosUtils {
  public async request(config: AxiosRequestConfig) {
    try {
      return axios.request(config);
    } catch (error) {
      console.error(`UNHANDLED ERROR, ${error}`);
    }
  }
}
