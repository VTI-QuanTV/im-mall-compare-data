import axios, { AxiosRequestConfig, AxiosResponse } from 'axios';

export class AxiosUtils {
  public async request(config: AxiosRequestConfig): Promise<AxiosResponse> {
    try {
      return axios.request(config);
    } catch (error) {
      console.error(`UNHANDLED ERROR, ${error}`);
    }
  }
}
