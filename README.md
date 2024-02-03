# TeamProject2


Project Architecture<br>

Controller<br>
    1.common : 메인홈페이지와 로그인 관련 컨트롤러 와 페이지 전환을 위한 FormController<br>
        - InfromationController.java<br>
        - JoinController.java<br>
        - JoinFormController.java<br>
        - LoginController.java<br>
        - LogoutController.java<br>
        - MainController.java<br>
        - MainLog.java<br>
        - Outcontroller.java<br>
        - OutFormController.java<br>
    2.dept : 부서의 정보를 호출 및 수정 을 위한 컨트롤러<br>
        - DeleteDeptController.java<br>
        - GetDeptController.java<br>
        - GetDeptListController.java<br>
        - InsertDeptController.java<br>
        - InsertDeptFormController.java<br>
        - UpdateDeptController.java<br>
        - UpdateDeptFormController.java<br>
    3.emp : 사원의 정보를 호출 및 수정을 위한 컨트롤러<br>
        - GetEmp.java<br>
        - GetEmpList.java<br>
        - UpdateEmpController.java<br>
        - UpdateEmpController.java<br>
Filter : 매핑(url) 에 통일된 주소를 매핑해서 로그인을 필요로 하는 페이지  접근제한(url 접속, 뒤로가기)을,를 추가하는 필터<br>
    - EncodingFilter.java<br>
    - LoginFilter.java<br>
Util : 데이터 베이스와 연결한다.<br>
    - DBUtil.java<br>
Dto : 부서와 사원에 데이터베이스와 매핑할수있는 객체 생성<br>
    - Dept.java<br>
    - Emp.java<br>
Dao : 부서와 사원에 대한 정보를 데이터베이스로부터 호출 또는 수정 및 반환 및 삭제 를 한다.<br>
    - DeptDAO.java<br>
    - EmpDAO.java

프로젝트 제작 기간<br>
2024-01-04 ~ 2024-01-06 2DAY<br>
프로젝트 소개/ 역할/ 후기 <br>

소개
<br>
멀티캠퍼스 강의를 수업받으며 작성한 부서/ 사원 프로젝트를 기반으로 새로운 기능을 추가했다.
처음으로 데이터베이스와 연결해서 만드는 애플리케이션으로 다소 부족한 부분이 있지만 팀원들과 소통을 하며 <br>
제작하여 소중한 팀프로젝트였다. 
<br>
팀원과 함께 제작한 기능

- 사원 데이터 추가<br>
    Request, Response 를 사용해 입련한 정보를 데이터베이스로 전달.

- 사원 데이터 변경<br>
    사원 번호를 데이터베이스로 전달해서 해당하는 데이터를 찾아 변경.

- 사원 데이터 삭제<br>
    사원 번호를 데이터베이스에서 찾아 해당하는 데이터 삭제.
- 사원 정보 상세<br>
    로그인 이후 저장된 사원 정보(사원번호)를 데이터베이스에 전달해서 데이터를 반환받아 출력

- 사원 데이터 리스트화<br>
    데이터베이스에 사원 정보가 저장된 테이블을 전부 반환받아 화면에 출력함<br>

역할<br>

사원 정보 상세<br>

    로그인 상태에서 정보상세 페이지가 활성화 되도록 ${not empty sessionScope.userId}를 사용하고,<br>
    버튼을 눌러 페이지로 넘어갈때 <br>
    onclick="location.href='information?userId=${sessionScope.userId}' 를 추가해 전달받은 userId 와 SELECT문을 데이터베이스로 전달해서 일치하는 데이터를 반환 받아온다.<br>

후기<br>

    데이터베이스와 연결하는 숙련도가 많이 부족해서 완벽한 코드를 작성하지못했지만.
    팀원들과 머리를 맞대고 제작한 프로젝트이며, 멀티캠퍼스 강의를 처음시작한 시기의
    자신과 비교해볼수있는 좋은 시간이였다. 앞으로 더욱 효율성있고 완벽에가까운 코드를작성하는
    백엔드 개발자가 되기위해 노력하자.