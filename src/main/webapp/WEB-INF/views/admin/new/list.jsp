<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url var="deleteNew" value="/quan-tri/bai-viet/delete" />
<c:url var="newURL" value="/quan-tri/bai-viet/danh-sach" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Danh sách bài viết</title>
</head>

<body>
	<div class="main-content">
		<form action="<c:url value='/quan-tri/bai-viet/danh-sach'/>" id="formSubmit" method="get">
			
				<div class="main-content-inner">
					<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">Trang chủ</a>
							</li>
						</ul>
						<!-- /.breadcrumb -->
					</div>
					<div class="page-content">
						<div class="row">
							<div class="col-xs-12">
								<c:if test="${not empty message}">
									<div class="alert alert-${alert}">
			  							${message}
									</div>
								</c:if>
								<div class="widget-box table-filter">
									<div class="table-btn-controls">
										<div class="pull-right tableTools-container">
											
											<div class="dt-buttons btn-overlap btn-group">
											
												<span >
													<input type="text" id="title" name="title" placeholder="tìm kiếm bài viết" style="height: 30px; margin-right:10px;margin-top:5px" />
													
													<button style="margin-right:10px;margin-top:5px">Tìm kiếm</button>
												</<span>
												
												<c:url var="createNewURL" value="/quan-tri/bai-viet/chinh-sua"/>
												<a flag="info"
												   class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip"
												   title='Thêm bài viết' href='${createNewURL}'>
															<span>
																<i class="fa fa-plus-circle bigger-110 purple"></i>
															</span>
												</a>

												
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12">
										<div class="table-responsive">
											<table class="table table-bordered">
												<thead>
													<tr>
													
														<th>Tên bài viết</th>
														<th>Mô tả ngắn</th>
														<th>Thao tác</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="item" items="${model}">
														<tr>
														
															<td>${item.title}</td>
															<td>${item.shortDescription}</td>
															<td>
																<c:url var="updateNewURL" value="/quan-tri/bai-viet/chinh-sua">
																	<c:param name="id" value="${item.id}"/>															
																</c:url>																
																<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
																   title="Cập nhật bài viết" href='${updateNewURL}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
																</a>
																
																
																<c:url var="deleteURL" value="/quan-tri/bai-viet/delete">
																	<c:param name="id" value="${item.id}"/>															
																</c:url>
																<a  onclick="warningBeforeDelete()" 
																	class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" 
																	data-toggle="tooltip" title='Xóa bài viết'
																	href="${deleteURL}">
																				<span>
																					<i class="fa fa-trash-o bigger-110 pink"></i>
																				</span>
																</a>
																
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											
																		
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		</form>
		
		</div>
		

</body>
</html>