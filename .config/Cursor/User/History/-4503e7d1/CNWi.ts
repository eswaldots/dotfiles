import { PublicRepein, Records } from "@/models/analysis-model";
import { create } from "zustand";
import { BoundingBandModel } from "../-models/bounding-band.model";
import { BoundingRequest } from "../-models/bounding-request";

interface BoundingStore {
  member: PublicRepein | null;
  boundingBand: BoundingBandModel[] | null 
  boundingMember: Records[] | null
  band: string | null;
  setBoundingBand: (data: BoundingBandModel) => void;
  setMember: (member: PublicRepein) => void;
  setBand: (band: string) => void;
  setBoundingMember: (boundingMember: Records) => void;
}

const useBounding = create<BoundingStore>((set) => ({
  member: null,
  band: null,
  boundingBand: [],
  boundingMember: [],
  setBoundingBand: (data: BoundingBandModel) => set((state) => {
    return { boundingBand: [...(state.boundingBand || []), data] };
  }),
  setMember: (member: PublicRepein) => set({ member }),
  setBand: (band: string) => set({ band }),
  setBoundingMember: (boundingMember: Records) => set((state) => {

    if (state.boundingMember?.some((member) => member.id === boundingMember.id)) {
      return state;    
    }

    return { boundingMember: [...(state.boundingMember || []), boundingMember] };
  }),
}));

export const getBounding = (state: BoundingStore) => {
  return {
    repein_id: state.member?.repein_id,
    band_id: state.band,
    bounding_band: state.boundingBand,
    repein_records: state.boundingMember,
  };
};

export default useBounding;

