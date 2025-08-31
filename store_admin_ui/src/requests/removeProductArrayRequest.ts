import { productsRemote } from '../remotes/productsRemote'
import { StructureWithIdRecord } from '../structures/StructureWithIdRecord';

export type RequestRemoveProductArrayProps = {
  payload: StructureWithIdRecord[]
}
export type RequestRemoveProductArrayResponse = any

export const removeProductArrayRequest = async (props: RequestRemoveProductArrayProps): Promise<RequestRemoveProductArrayResponse> => {

  const { data } = await productsRemote.request<RequestRemoveProductArrayResponse>({
    method: `POST`,
    url: `/system/public_product/removeAll`,
    data: Object.assign([], props.payload),
    params: {},
    paramsSerializer: {
      indexes: null
    },
    headers: {
      Authorization: `Bearer ${props.token}`
    },
  })

  return data
}
