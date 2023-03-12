DECLARE
empid VARCHAR2(30) := :P999_EMP_ID;
BEGIN
FOR x IN (select e.EMP_ID emp_id, e.EMP_FIRST_NAME || ' '|| e.EMP_LAST_NAME   names,   
    to_char(e.EMP_DOB, 'dd-Mon-yyyy')    dob,
    e.EMP_LAST_EDU last_edu,
    e.EMP_NID nid,
    CASE WHEN e.EMP_GENDER = 'M' THEN 'Male' WHEN e.EMP_GENDER = 'F' THEN 'Female' else 'Others' END as gender,
    CASE WHEN e.EMP_MARIT_STATUS = 'U' THEN 'Unmarried' else 'Married' end as married,
    e.EMP_RELIGION religion,
    e.EMP_CELL cell,
    e.EMP_EMAIL email,
    e.EMP_PASSPORT_NO passport,
    e.EMP_FNAME father,
    e.EMP_MNAME mother,
    e.EMP_PR_ADDRESS present_add,
    e.VILL_WARD ||', '||
    e.EMP_UNION || ', ' ||
    e.EMP_UPZILA || ', ' ||
    e.EMP_DIST || ', ' || e.EMP_NATION permanent_add,
    to_char( e.EMP_HIRE_DT, 'dd-Mon-yyyy')  hire_date,      
    TO_CHAR(e.EMP_BASIC_SALARY,'L99G999D99MI') salary,
    c.COM_NAME company,
    d.DESIG_TITLE designation  
from DESIGNATIONS d,
    COMPANY_INFOS c,
    EMPLOYEES e
    where c.com_id = e.com_id and e.emp_desig_id = d.desig_id and e.EMP_ID = empid) LOOP
   

sys.htp.p('
<style>
 .info-list {
  font-size: 18px;
}
span {
  font-weight: bold;
}

.msg {
  padding: 10px;
  background: #222;
  position: relative;
}
.msg h1 {
  color: #000;
}
.msg a {
  margin-left: 20px;
  background: #408814;
  color: white;
  padding: 4px 8px;
  text-decoration: none;
}
.msg a:hover {
  background: #266400;
}

/* //-- yui-grids style overrides -- */
body {
  font-family: Georgia;
  color: #444;
}
#inner {
  padding: 10px 80px;
  margin: 80px auto;
  background: #f5f5f5;
  border: solid #666;
  border-width: 8px 0 2px 0;
}
.yui-gf {
  margin-bottom: 2em;
  padding-bottom: 2em;
  border-bottom: 1px solid #ccc;
}

.contact-info img {
  width: 90px;
  height: 100px;
  float: right;
}
/* //-- header, body, footer -- */
#hd {
  margin: 2.5em 0 3em 0;
  padding-bottom: 1.5em;
  border-bottom: 1px solid #ccc;
}
#hd h2 {
  text-transform: uppercase;
  letter-spacing: 2px;
}
#bd,
#ft {
  margin-bottom: 2em;
}

/* //-- footer -- */
#ft {
  padding: 1em 0 5em 0;
  font-size: 92%;
  border-top: 1px solid #ccc;
  text-align: center;
}
#ft p {
  margin-bottom: 0;
  text-align: center;
}

/* //-- core typography and style -- */
#hd h1 {
  font-size: 48px;
  text-transform: uppercase;
  letter-spacing: 3px;
}
h2 {
  font-size: 152%;
}
h3,
h4 {
  font-size: 122%;
}
h1,
h2,
h3,
h4 {
  color: #333;
}
p {
  font-size: 100%;
  line-height: 18px;
  padding-right: 3em;
}
a {
  color: #990003;
}
a:hover {
  text-decoration: none;
}
strong {
  font-weight: bold;
}
li {
  line-height: 24px;
}
p.enlarge {
  font-size: 144%;
  padding-right: 6.5em;
  line-height: 24px;
}
p.enlarge span {
  color: #000;
}
.contact-info {
  margin-top: 7px;
}
.first h2 {
  font-style: italic;
}
.last {
  border-bottom: 0;
}

/* //-- section styles -- */

a#pdf {
  display: block;
  float: left;
  background: #666;
  color: white;
  padding: 6px 50px 6px 12px;
  margin-bottom: 6px;
  text-decoration: none;
}
a#pdf:hover {
  background: #222;
}

.job {
  position: relative;
  margin-bottom: 1em;
  padding-bottom: 1em;
  border-bottom: 1px solid #ccc;
}
.job h4 {
  position: absolute;
  top: 0.35em;
  right: 0;
}
.job p {
  margin: 0.75em 0 3em 0;
}

.last {
  border: none;
}
.skills-list {
  margin: 0;
}
.skills-list ul {
  margin: 0;
}
.skills-list li {
  margin: 3px 0;
  padding: 3px 0;
}
.skills-list li span {
  font-size: 152%;
  display: block;
  margin-bottom: -2px;
  padding: 0;
}
.talent {
  width: 32%;
  float: left;
}
.talent h2 {
  margin-bottom: 6px;
}

#srt-ttab {
  margin-bottom: 100px;
  text-align: center;
}
#srt-ttab img.last {
  margin-top: 20px;
}

/* --// override to force 1/8th width grids -- */
.yui-gf .yui-u {
  width: 80.2%;
}
.yui-gf div.first {
  width: 12.3%;
}



</style>');



sys.htp.p('<div id="doc2" class="yui-t7">
      <div id="inner">
        <div id="hd">
          <div class="yui-gc">
            <div class="yui-u first">
              <h1>'||x.names||'</h1>
              <h2>'||x.designation||'</h2>
            </div>
            <div class="yui-u">
              <div class="contact-info">
                   <img alt="'||x.names||'" style="border: 2px solid #CCC; 
            -moz-border-radius: 4px; -webkit-border-radius: 2px;" '||
            'src="'||apex_util.get_blob_file_src('P201_EMP_IMAGE',x.emp_id)||'" height="75"  
            width="75" />
              </div>
              
            </div>
          </div>
        
        </div>
        

    <div id="bd">
          <div id="yui-main">
            <div class="yui-b">
        
              <div class="yui-gf">
                <div class="yui-u first">
                  <h2>Contact</h2>
                </div>
                <div class="yui-u">
                  <div class="talent">
                    <h2>Contact Information</h2>
                    <span>Phone:</span>
                    <p>'||x.cell||'</p>
                    <span>Email:</span>
                    <p>'||x.email||'</p>
                  </div>

                  <div class="talent">
                    <h2>Present Address</h2>
                    <p>'||x.present_add||'</p>
                  </div>

                  <div class="talent">
                    <h2>Permanent Address</h2>
                    <p>'||x.permanent_add||'</p>
                  </div>
                </div>
              </div>

              <div class="yui-gf">
                <div class="yui-u first">
                  <h2>Basic Information</h2>
                </div>
                <div class="yui-u">
                  <ul class="talent">
                    <li>
                      <span>Gender: </span>
                      <p>'||x.gender||'</p>
                    </li>
                    <li>
                      <span>Birthday: </span>
                      <p>'||x.dob||'</p>
                    </li>
		

			<li>
                      <span>Religion: </span>
                      <p> '||x.religion||'</p>
                    </li>

                    <li class="last">
                      <span>Maritial Status:</span>
                      <p>'||x.married||'</p>
                    </li>
                  </ul>

                  <ul class="talent">
                    <li>
                      <span>Father Name: </span>
                      <p>'||x.father||'</p>
                    </li>
                    <li>
                      <span>Mother Name: </span>
                      <p>'||x.mother||'</p>
                    </li>
					<li><span>National ID: </span>
						<p>'||x.nid||'</p></li>
                    <li class="last">
                      <span>Passport: </span>
                      <p>'||x.passport||'</p>
                    </li>
                  </ul>

                  <ul class="talent">
                    <li>
                      <span>Educational Qualification:</span>
                      <p>'||x.last_edu||'</p>
                    </li>
                    <li>
                      <span>Hire Date: </span>
                      <p>'||x.hire_date||'</p>
                    </li>
                    <li>
                      <span>Salary: </span>
                      <p>'||x.salary||'</p>
                    </li>
                    <li class="last">
                      <span>Company Name:</span>
                      <p>'||x.company||'</p>
                    </li>
                  </ul>
                </div>
              </div>
              
            </div>
           
          </div>
      
        </div>  
      </div>

    </div>');
    END LOOP;
    END;