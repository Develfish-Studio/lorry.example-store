import { structureRemote } from '../remotes/structureRemote'
import { StructureWithIdRecord } from '../structures/StructureWithIdRecord';

export type RequestRemoveGuideSubjectArrayProps = {
  payload: StructureWithIdRecord[]
}
export type RequestRemoveGuideSubjectArrayResponse = any

export const removeGuideSubjectArrayRequest = async (props: RequestRemoveGuideSubjectArrayProps): Promise<RequestRemoveGuideSubjectArrayResponse> => {

  const { data } = await structureRemote.request<RequestRemoveGuideSubjectArrayResponse>({
    method: `POST`,
    url: `/system/public_guide_subject/removeAll`,
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
