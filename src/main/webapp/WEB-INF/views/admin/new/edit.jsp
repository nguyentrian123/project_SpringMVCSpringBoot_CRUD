<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="newURL" value="/quan-tri/bai-viet/danh-sach" />
<c:url var="newAPI" value="/api/new" />
<c:url var="editNewURL" value="/quan-tri/bai-viet/chinh-sua" />

<html>
<head>
<title>Chỉnh sửa bài viết</title>
</head>
<body>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
					try {
						ace.settings.check('breadcrumbs', 'fixed')
					} catch (e) {
					}
				</script>

				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
					</li>

					<li><a href="#">Forms</a></li>
					<li class="active">Form Elements</li>
				</ul>
				<!-- /.breadcrumb -->
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
						<c:if test="${not empty message}">
							<div class="alert alert-${alert}">${message}</div>
						</c:if>
						
						
						 <form id="formSubmit" action="<c:url value="/quan-tri/bai-viet/add-edit" />"  method="post">
						 
							<label class="col-sm-3 control-label no-padding-right">Thể loại</label>
							<div class="form-group">
								<div class="col-sm-5">
								
									<select class="form-control" id="categoryId" name="categoryId">
                                        <c:if test="${empty model.getCategory().getId()}">
                                            <option value="">Chọn loại bài viết</option>
                                            <c:forEach var="item" items="${categories}">
                                                <option value="${item.key}">${item.value}</option>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${not empty model.getCategory().getId()}">
                                            <option value="">Chọn loại bài viết</option>
                                            <c:forEach var="item" items="${categories}">
                                                <option value="${item.key}" <c:if test="${item.key == model.getCategory().getId() }">selected="selected"</c:if>>
                                                        ${item.value}
                                                </option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
     	 	
								</div>
							</div>
							<br/>
                            <br/>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1">Tên bài viết</label>
								<div class="col-sm-5">
									 <input type="text" class="form-control" id="title" name="title" value="${model.title}"/>
								</div>
							</div>
							<br/>
                            <br/>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1">Ảnh đại diện</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="thumbnail" name="thumbnail" value="${model.thumbnail}"/>
								</div>
							</div>
							<br/>
                            <br/>
							<div class="form-group">
								<label for="shortDescription"
									class="col-sm-3 control-label no-padding-right">Mô tả
									ngắn:</label>
								<div class="col-sm-5">
									<input type="text"  style="width: 820px" class="form-control" id="shortDescription" name="shortDescription" value="${model.shortDescription}"/>
								</div>
							</div>
							<br/>
                            <br/>
							<div class="form-group">
								<label for="content"
									class="col-sm-3 control-label no-padding-right">Nội
									dung:</label>
								<div class="col-sm-9">		
									<textarea rows="" cols="" id="content" name="content" style="width: 820px;height: 175px">${model.content}</textarea>
								</div>
							</div>
							<br/>
                            <br/>
                            <input type="hidden"  id="id" name="id" value="${model.id}"/>
							<div class="clearfix form-actions">
								<div class="col-md-offset-3 col-md-9">
									<c:if test="${not empty model.id}">
										<button class="btn btn-info" type="submit"
											>
											<i class="ace-icon fa fa-check bigger-110"></i> Cập nhật bài
											viết
										</button>
									</c:if>
									<c:if test="${empty model.id}">
										<button class="btn btn-info" type="submit"
											>
											<i class="ace-icon fa fa-check bigger-110"></i> Thêm bài viết
										</button>
									</c:if>

								
									<button class="btn" type="reset">
										<i class="ace-icon fa fa-undo bigger-110"></i> Hủy
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



</body>
</html>
