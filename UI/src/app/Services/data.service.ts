import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { environment } from "src/environments/environment";

@Injectable({
  providedIn: 'root'
})

export class APIservicesService {
    baseApiUrl: string = environment.baseApiUrl;  
    
    constructor(private http: HttpClient) {
    }
  
    getAllStudent(): any {
      return this.http.get<any>(this.baseApiUrl + "/api/students")
    }
    
    getAllSubjectById(id: any): any {
      return this.http.get<any>(this.baseApiUrl + "/api/score/"+id)
    }

    getAllRateById(id: any): any {
      return this.http.get<any>(this.baseApiUrl + "/api/rate/"+id)
    }

    getAllTop5SubjectById(id: any, sem: any): any {
      return this.http.get<any>(this.baseApiUrl + "/api/get_Subject_From_Top5Avg?grade="+sem+"&student_code="+id)
    }

    getAllTop10GroupById(id: any): any {
      return this.http.post<any>(this.baseApiUrl + "/api/create_group_subject_from_top5?student_code="+id, id)
    }

    getGroupBy3Subject(id: any): any {
      return this.http.post<any>(this.baseApiUrl + "/api/reverse_group_subject?subjects="+id, id)
    }

    getFindGroupSubject(id:any) {
      return this.http.get<any>(this.baseApiUrl + "/api/find_group_subject?code_student="+id)
    }

    getRecommendGroup(id:any) {
      return this.http.get<any>(this.baseApiUrl + "/api/recommend_group?code_student="+id)
    }

    getScoreGroup(grade: any, group: any){
      return this.http.get<any>(this.baseApiUrl + "/api/get_Score_Group?group="+group+"&grade="+grade)
    }
}