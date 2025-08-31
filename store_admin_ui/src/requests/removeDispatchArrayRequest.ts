import { eventsRemote } from '../remotes/eventsRemote'
import { StructureWithIdRecord } from '../structures/StructureWithIdRecord';

export type RequestRemoveDispatchArrayProps = {
  payload: StructureWithIdRecord[]
}
export type RequestRemoveDispatchArrayResponse = any

export const removeDispatchArrayRequest = async (props: RequestRemoveDispatchArrayProps): Promise<RequestRemoveDispatchArrayResponse> => {

  const { data } = await eventsRemote.request<RequestRemoveDispatchArrayResponse>({
    method: `POST`,
    url: `/system/public_dispatch/removeAll`,
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
