<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="/Date/dateplan/comment.css">    
<<script type="text/javascript">
<!--
	(function($) {
		// ����ּ� (��� ��ħ ���� �ʼ�)
		$('.commentBtn').on('click', '> .btn-address', function(e) {
			var container;
			return container = $(this).parents('.media-body').find('> .rp-address').css('height', 'auto').slideToggle();
		});
		// ��� �ڵ� ��ũ (��� ��ħ ���� �ʼ�)
		$(".comments-article").each(function(){
			$(this).html( $(this).html().replace(/((http|https|ftp):\/\/[\w?=&.\/-;#~%-]+(?![\w\s?&.\/;#~%"=-]*>))/g, '$1 ') );
	    });
	}(jQuery));
//-->
</script>

<s_rp>
   <div class="comment">
      <h3>Comments</h3>
      <div class="commentList">
         <s_rp_container>
            <s_rp_rep>
               <div id='[##_rp_rep_id_##]' class="well">
                  <div class="[##_rp_rep_class_##] media">
                     <div class="media-left">
                        <img src="./images/Guest_04.jpg" class="guest-icon">
                        <span class="user-icon">[##_rp_rep_name_##]</span>
                     </div>
                     <div class="media-body">
                        <h4 class="margin-t-0 name">[##_rp_rep_name_##]</h4>
                        <p><span class="date">[##_rp_rep_date_##]</span></p>
                        <p class="comments-article">[##_rp_rep_desc_##]</p>
                        <p class='commentBtn'>
                           <button class="btn-address btn btn-sm btn-default"><i class="fa fa-link"></i> ����ּ�</button>
                           <a href="#" onclick="" class="modify btn btn-sm btn-default">
                              <i class="fa fa-pencil-square"></i> ����/����
                           </a>
                           <a href="#" onclick="" class="write btn btn-sm btn-default">
                              <i class="fa fa-comments"></i> ��۾���
                           </a>
                        </p>
                        <p class="rp-address"><i class="fa fa-link"></i> http://<script>document.write(location.host)</script>[##_rp_rep_link_##]</p>
                     </div>
                  </div>
                  <s_rp2_container> 
                     <s_rp2_rep>
                        <div id='[##_rp_rep_id_##]' class="well">
                           <div class="[##_rp_rep_class_##] media">
                              <div class="media-left">
                                 <img src="./images/Guest_04.jpg" class="guest-icon">
                                 <span class="user-icon">[##_rp_rep_name_##]</span>
                              </div>
                              <div class="media-body">
                                 <h4 class="margin-t-0 name">[##_rp_rep_name_##]</h4>
                                 <p><span class="date">[##_rp_rep_date_##]</span></p>
                                 <p class="comments-article">[##_rp_rep_desc_##]</p>
                                 <p class='commentBtn'>
                                    <button class="btn-address btn btn-sm btn-default" ><i class="fa fa-link"></i> ����ּ�</button>
                                    <a href="#" onclick="" class="modify btn btn-sm btn-default">
                                       <i class="fa fa-pencil-square"></i> ����/����
                                    </a>
                                 </p>
                                 <p class="rp-address"><i class="fa fa-link"></i> http://<script>document.write(location.host)</script>[##_rp_rep_link_##]</p>
                              </div>
                           </div>
                        </div>
                     </s_rp2_rep>
                  </s_rp2_container>
               </div>
            </s_rp_rep>
         </s_rp_container>
      </div>
      <s_rp_input_form>
         <div class="commentWrite well">
            <s_rp_member>
               <s_rp_guest>
                  <div class="form-group">
                     <label for="name">Name</label>
                     <input type="text" name="[##_rp_input_name_##]" class="form-control input-sm" id="contactName" placeholder="�̸� �Ǵ� ������ ��������."/>
                  </div>
                  <div class="form-group">
                     <label for="password">Password</label>
                     <input type="password" maxlength="8" name="[##_rp_input_password_##]" class="form-control input-sm" id="contactEmail" placeholder="��й�ȣ�� �ְ� ���� ������."/>
                  </div>
                  <div class="form-group">
                     <label for="homepage">Homepage</label>
                     <input type="url" class="homepage form-control input-sm" name="[##_rp_input_homepage_##]" id="contactEmail" placeholder="Ȩ�������� �����ֽø� �湮�� �����."/>
                  </div>
               </s_rp_guest>
               <p class="secretWrap">
                  <label class="btn btn-success">
                     <input type="checkbox" name="[##_rp_input_is_secret_##]"/> ��б�
                  </label>
                  <p class="help-block">���� ����(�̸���) ���� ���� �ÿ��� ��б۷� �� �ּ���. �������� ������ �����ϴϱ��.</p>
               </p>
            </s_rp_member>
            <div class="form-group">
               <label for="contactComment">Comment</label>
               <textarea name="[##_rp_input_comment_##]" rows="3" class="form-control" id="contactComment"></textarea>
            </div>
            <p>
               <button type="submit" onclick=""  class="btn btn-primary btn-block"/>��� �ޱ�</button>
            </p>
         </div> 
      </s_rp_input_form>
   </div>
</s_rp>