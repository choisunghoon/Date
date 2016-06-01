<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<input type="button" id="execute" value="execute" />

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
    $('#execute').click(function(){  // �±� Ŭ����(execute) ã�� Ŭ���̺�Ʈ�߻��� ����
        $.ajax({
            url:'index.jsp?id=java',	//������ ������ ������.
            type:'post',				//���۹���
            success:function(data){		//����������..�����ϴ� �Լ�..
                $('#time').append('<font color=red>'+data+'</font>');
            }
        })
    })
</script>


<p>time : <span id="time"></span></p>
