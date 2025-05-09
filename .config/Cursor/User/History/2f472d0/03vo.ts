import type { PublicRepein, Records } from "@/models/analysis-model";
import { GenericGetResponse } from "@/models/archive-models";
import { invoke } from "@tauri-apps/api/core";

export async function getPublicRepein() {
    try {
        return await invoke<GenericGetResponse<PublicRepein[]>>("get_public_repein") 
    }
    catch(e) {
        return e as GenericGetResponse<null>
    }
}

export async function getRepeinRecordsById(repeinId: number) {
    try {
        return await invoke<GenericGetResponse<Records[]>>("get_repein_records_by_id", { repeinId })
    }
    catch(e) {
        return e as GenericGetResponse<null>
    }
}

