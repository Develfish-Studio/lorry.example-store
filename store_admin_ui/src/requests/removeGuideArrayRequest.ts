import { structureRemote } from '../remotes/structureRemote'
import { StructureWithIdRecord } from '../structures/StructureWithIdRecord';

export type RequestRemoveGuideArrayProps = {
  payload: StructureWithIdRecord[]
}
export type RequestRemoveGuideArrayResponse = any

export const removeGuideArrayRequest = async (props: RequestRemoveGuideArrayProps): Promise<RequestRemoveGuideArrayResponse> => {

  const { data } = await structureRemote.request<RequestRemoveGuideArrayResponse>({
    method: `POST`,
    url: `/system/public_guide/removeAll`,
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
