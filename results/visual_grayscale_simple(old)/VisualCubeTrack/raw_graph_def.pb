
C
global_step/initial_valueConst*
value	B : *
dtype0
W
global_step
VariableV2*
shared_name *
dtype0*
	container *
shape: 

global_step/AssignAssignglobal_stepglobal_step/initial_value*
use_locking(*
T0*
_class
loc:@global_step*
validate_shape(
R
global_step/readIdentityglobal_step*
T0*
_class
loc:@global_step
;
steps_to_incrementPlaceholder*
dtype0*
shape: 
9
AddAddglobal_step/readsteps_to_increment*
T0
t
AssignAssignglobal_stepAdd*
T0*
_class
loc:@global_step*
validate_shape(*
use_locking(
V
visual_observation_0Placeholder*
dtype0*$
shape:’’’’’’’’’TT
J
vector_observationPlaceholder*
dtype0*
shape:’’’’’’’’’ 
w
%normalization_steps/Initializer/zerosConst*&
_class
loc:@normalization_steps*
value	B : *
dtype0

normalization_steps
VariableV2*
shared_name *&
_class
loc:@normalization_steps*
dtype0*
	container *
shape: 
ŗ
normalization_steps/AssignAssignnormalization_steps%normalization_steps/Initializer/zeros*
use_locking(*
T0*&
_class
loc:@normalization_steps*
validate_shape(
j
normalization_steps/readIdentitynormalization_steps*
T0*&
_class
loc:@normalization_steps
h
running_mean/Initializer/zerosConst*
_class
loc:@running_mean*
valueB *
dtype0
{
running_mean
VariableV2*
shape: *
shared_name *
_class
loc:@running_mean*
dtype0*
	container 

running_mean/AssignAssignrunning_meanrunning_mean/Initializer/zeros*
_class
loc:@running_mean*
validate_shape(*
use_locking(*
T0
U
running_mean/readIdentityrunning_mean*
T0*
_class
loc:@running_mean
o
!running_variance/Initializer/onesConst*#
_class
loc:@running_variance*
valueB *
dtype0

running_variance
VariableV2*
shape: *
shared_name *#
_class
loc:@running_variance*
dtype0*
	container 
­
running_variance/AssignAssignrunning_variance!running_variance/Initializer/ones*
use_locking(*
T0*#
_class
loc:@running_variance*
validate_shape(
a
running_variance/readIdentityrunning_variance*
T0*#
_class
loc:@running_variance
;
ShapeShapevector_observation*
T0*
out_type0
A
strided_slice/stackConst*
valueB: *
dtype0
C
strided_slice/stack_1Const*
valueB:*
dtype0
C
strided_slice/stack_2Const*
valueB:*
dtype0
į
strided_sliceStridedSliceShapestrided_slice/stackstrided_slice/stack_1strided_slice/stack_2*
end_mask *
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask 
>
Add_1Addnormalization_steps/readstrided_slice*
T0
:
SubSubvector_observationrunning_mean/read*
T0
;
CastCastAdd_1*

SrcT0*
Truncate( *

DstT0
&
truedivRealDivSubCast*
T0
?
Sum/reduction_indicesConst*
value	B : *
dtype0
P
SumSumtruedivSum/reduction_indices*
T0*

Tidx0*
	keep_dims( 
-
add_2Addrunning_mean/readSum*
T0
0
Sub_1Subvector_observationadd_2*
T0

mulMulSub_1Sub*
T0
A
Sum_1/reduction_indicesConst*
value	B : *
dtype0
P
Sum_1SummulSum_1/reduction_indices*
T0*

Tidx0*
	keep_dims( 
3
add_3Addrunning_variance/readSum_1*
T0
z
Assign_1Assignrunning_meanadd_2*
_class
loc:@running_mean*
validate_shape(*
use_locking(*
T0

Assign_2Assignrunning_varianceadd_3*
validate_shape(*
use_locking(*
T0*#
_class
loc:@running_variance

Assign_3Assignnormalization_stepsAdd_1*
use_locking(*
T0*&
_class
loc:@normalization_steps*
validate_shape(
3

group_depsNoOp	^Assign_1	^Assign_2	^Assign_3
<
sub_2Subvector_observationrunning_mean/read*
T0
P
Cast_1Castnormalization_steps/read*
Truncate( *

DstT0*

SrcT0
4
add_4/yConst*
valueB
 *  ?*
dtype0
&
add_4AddCast_1add_4/y*
T0
;
	truediv_1RealDivrunning_variance/readadd_4*
T0
 
SqrtSqrt	truediv_1*
T0
*
	truediv_2RealDivsub_2Sqrt*
T0
G
normalized_state/Minimum/yConst*
valueB
 *   @*
dtype0
S
normalized_state/MinimumMinimum	truediv_2normalized_state/Minimum/y*
T0
?
normalized_state/yConst*
valueB
 *   Ą*
dtype0
R
normalized_stateMaximumnormalized_state/Minimumnormalized_state/y*
T0
5

batch_sizePlaceholder*
shape:*
dtype0
:
sequence_lengthPlaceholder*
shape:*
dtype0
;
masksPlaceholder*
dtype0*
shape:’’’’’’’’’
A
epsilonPlaceholder*
dtype0*
shape:’’’’’’’’’
=
Cast_2Castmasks*

SrcT0*
Truncate( *

DstT0
M
#is_continuous_control/initial_valueConst*
value	B : *
dtype0
a
is_continuous_control
VariableV2*
	container *
shape: *
shared_name *
dtype0
¾
is_continuous_control/AssignAssignis_continuous_control#is_continuous_control/initial_value*
use_locking(*
T0*(
_class
loc:@is_continuous_control*
validate_shape(
p
is_continuous_control/readIdentityis_continuous_control*
T0*(
_class
loc:@is_continuous_control
M
#trainer_major_version/initial_valueConst*
value	B : *
dtype0
a
trainer_major_version
VariableV2*
shape: *
shared_name *
dtype0*
	container 
¾
trainer_major_version/AssignAssigntrainer_major_version#trainer_major_version/initial_value*
T0*(
_class
loc:@trainer_major_version*
validate_shape(*
use_locking(
p
trainer_major_version/readIdentitytrainer_major_version*(
_class
loc:@trainer_major_version*
T0
M
#trainer_minor_version/initial_valueConst*
dtype0*
value	B :
a
trainer_minor_version
VariableV2*
shape: *
shared_name *
dtype0*
	container 
¾
trainer_minor_version/AssignAssigntrainer_minor_version#trainer_minor_version/initial_value*
use_locking(*
T0*(
_class
loc:@trainer_minor_version*
validate_shape(
p
trainer_minor_version/readIdentitytrainer_minor_version*(
_class
loc:@trainer_minor_version*
T0
M
#trainer_patch_version/initial_valueConst*
dtype0*
value	B : 
a
trainer_patch_version
VariableV2*
dtype0*
	container *
shape: *
shared_name 
¾
trainer_patch_version/AssignAssigntrainer_patch_version#trainer_patch_version/initial_value*
use_locking(*
T0*(
_class
loc:@trainer_patch_version*
validate_shape(
p
trainer_patch_version/readIdentitytrainer_patch_version*(
_class
loc:@trainer_patch_version*
T0
F
version_number/initial_valueConst*
dtype0*
value	B :
Z
version_number
VariableV2*
shape: *
shared_name *
dtype0*
	container 
¢
version_number/AssignAssignversion_numberversion_number/initial_value*
use_locking(*
T0*!
_class
loc:@version_number*
validate_shape(
[
version_number/readIdentityversion_number*
T0*!
_class
loc:@version_number
C
memory_size/initial_valueConst*
value	B : *
dtype0
W
memory_size
VariableV2*
shape: *
shared_name *
dtype0*
	container 

memory_size/AssignAssignmemory_sizememory_size/initial_value*
_class
loc:@memory_size*
validate_shape(*
use_locking(*
T0
R
memory_size/readIdentitymemory_size*
T0*
_class
loc:@memory_size
K
!action_output_shape/initial_valueConst*
dtype0*
value	B :
_
action_output_shape
VariableV2*
dtype0*
	container *
shape: *
shared_name 
¶
action_output_shape/AssignAssignaction_output_shape!action_output_shape/initial_value*
validate_shape(*
use_locking(*
T0*&
_class
loc:@action_output_shape
j
action_output_shape/readIdentityaction_output_shape*&
_class
loc:@action_output_shape*
T0
Ē
Kpolicy/main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniform/shapeConst*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_1/kernel*%
valueB"            *
dtype0
µ
Ipolicy/main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniform/minConst*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_1/kernel*
valueB
 *0½*
dtype0
µ
Ipolicy/main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniform/maxConst*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_1/kernel*
valueB
 *0=*
dtype0
 
Spolicy/main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniform/RandomUniformRandomUniformKpolicy/main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniform/shape*
seedG*
T0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_1/kernel*
dtype0*
seed2Y
®
Ipolicy/main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniform/subSubIpolicy/main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniform/maxIpolicy/main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniform/min*
T0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_1/kernel
ø
Ipolicy/main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniform/mulMulSpolicy/main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniform/RandomUniformIpolicy/main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniform/sub*
T0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_1/kernel
Ŗ
Epolicy/main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniformAddIpolicy/main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniform/mulIpolicy/main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniform/min*
T0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_1/kernel
Å
*policy/main_graph_0_encoder0/conv_1/kernel
VariableV2*
dtype0*
	container *
shape:*
shared_name *=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_1/kernel

1policy/main_graph_0_encoder0/conv_1/kernel/AssignAssign*policy/main_graph_0_encoder0/conv_1/kernelEpolicy/main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniform*
use_locking(*
T0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_1/kernel*
validate_shape(
Æ
/policy/main_graph_0_encoder0/conv_1/kernel/readIdentity*policy/main_graph_0_encoder0/conv_1/kernel*
T0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_1/kernel
Ø
:policy/main_graph_0_encoder0/conv_1/bias/Initializer/zerosConst*;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_1/bias*
valueB*    *
dtype0
µ
(policy/main_graph_0_encoder0/conv_1/bias
VariableV2*;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_1/bias*
dtype0*
	container *
shape:*
shared_name 

/policy/main_graph_0_encoder0/conv_1/bias/AssignAssign(policy/main_graph_0_encoder0/conv_1/bias:policy/main_graph_0_encoder0/conv_1/bias/Initializer/zeros*
validate_shape(*
use_locking(*
T0*;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_1/bias
©
-policy/main_graph_0_encoder0/conv_1/bias/readIdentity(policy/main_graph_0_encoder0/conv_1/bias*
T0*;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_1/bias
f
1policy/main_graph_0_encoder0/conv_1/dilation_rateConst*
valueB"      *
dtype0

*policy/main_graph_0_encoder0/conv_1/Conv2DConv2Dvisual_observation_0/policy/main_graph_0_encoder0/conv_1/kernel/read*
	dilations
*
T0*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingVALID
±
+policy/main_graph_0_encoder0/conv_1/BiasAddBiasAdd*policy/main_graph_0_encoder0/conv_1/Conv2D-policy/main_graph_0_encoder0/conv_1/bias/read*
T0*
data_formatNHWC
d
'policy/main_graph_0_encoder0/conv_1/EluElu+policy/main_graph_0_encoder0/conv_1/BiasAdd*
T0
Ē
Kpolicy/main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniform/shapeConst*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_2/kernel*%
valueB"             *
dtype0
µ
Ipolicy/main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniform/minConst*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_2/kernel*
valueB
 *óµ½*
dtype0
µ
Ipolicy/main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniform/maxConst*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_2/kernel*
valueB
 *óµ=*
dtype0
 
Spolicy/main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniform/RandomUniformRandomUniformKpolicy/main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniform/shape*
dtype0*
seed2k*
seedG*
T0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_2/kernel
®
Ipolicy/main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniform/subSubIpolicy/main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniform/maxIpolicy/main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniform/min*
T0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_2/kernel
ø
Ipolicy/main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniform/mulMulSpolicy/main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniform/RandomUniformIpolicy/main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniform/sub*
T0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_2/kernel
Ŗ
Epolicy/main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniformAddIpolicy/main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniform/mulIpolicy/main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniform/min*
T0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_2/kernel
Å
*policy/main_graph_0_encoder0/conv_2/kernel
VariableV2*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_2/kernel*
dtype0*
	container *
shape: *
shared_name 

1policy/main_graph_0_encoder0/conv_2/kernel/AssignAssign*policy/main_graph_0_encoder0/conv_2/kernelEpolicy/main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniform*
T0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_2/kernel*
validate_shape(*
use_locking(
Æ
/policy/main_graph_0_encoder0/conv_2/kernel/readIdentity*policy/main_graph_0_encoder0/conv_2/kernel*
T0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_2/kernel
Ø
:policy/main_graph_0_encoder0/conv_2/bias/Initializer/zerosConst*;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_2/bias*
valueB *    *
dtype0
µ
(policy/main_graph_0_encoder0/conv_2/bias
VariableV2*
dtype0*
	container *
shape: *
shared_name *;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_2/bias

/policy/main_graph_0_encoder0/conv_2/bias/AssignAssign(policy/main_graph_0_encoder0/conv_2/bias:policy/main_graph_0_encoder0/conv_2/bias/Initializer/zeros*
validate_shape(*
use_locking(*
T0*;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_2/bias
©
-policy/main_graph_0_encoder0/conv_2/bias/readIdentity(policy/main_graph_0_encoder0/conv_2/bias*
T0*;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_2/bias
f
1policy/main_graph_0_encoder0/conv_2/dilation_rateConst*
valueB"      *
dtype0

*policy/main_graph_0_encoder0/conv_2/Conv2DConv2D'policy/main_graph_0_encoder0/conv_1/Elu/policy/main_graph_0_encoder0/conv_2/kernel/read*
	dilations
*
T0*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
explicit_paddings
 *
paddingVALID
±
+policy/main_graph_0_encoder0/conv_2/BiasAddBiasAdd*policy/main_graph_0_encoder0/conv_2/Conv2D-policy/main_graph_0_encoder0/conv_2/bias/read*
T0*
data_formatNHWC
d
'policy/main_graph_0_encoder0/conv_2/EluElu+policy/main_graph_0_encoder0/conv_2/BiasAdd*
T0
u
*policy/main_graph_0_encoder0/flatten/ShapeShape'policy/main_graph_0_encoder0/conv_2/Elu*
T0*
out_type0
f
8policy/main_graph_0_encoder0/flatten/strided_slice/stackConst*
valueB: *
dtype0
h
:policy/main_graph_0_encoder0/flatten/strided_slice/stack_1Const*
valueB:*
dtype0
h
:policy/main_graph_0_encoder0/flatten/strided_slice/stack_2Const*
valueB:*
dtype0

2policy/main_graph_0_encoder0/flatten/strided_sliceStridedSlice*policy/main_graph_0_encoder0/flatten/Shape8policy/main_graph_0_encoder0/flatten/strided_slice/stack:policy/main_graph_0_encoder0/flatten/strided_slice/stack_1:policy/main_graph_0_encoder0/flatten/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask 
g
4policy/main_graph_0_encoder0/flatten/Reshape/shape/1Const*
valueB :
’’’’’’’’’*
dtype0
Ā
2policy/main_graph_0_encoder0/flatten/Reshape/shapePack2policy/main_graph_0_encoder0/flatten/strided_slice4policy/main_graph_0_encoder0/flatten/Reshape/shape/1*
T0*

axis *
N
«
,policy/main_graph_0_encoder0/flatten/ReshapeReshape'policy/main_graph_0_encoder0/conv_2/Elu2policy/main_graph_0_encoder0/flatten/Reshape/shape*
T0*
Tshape0

spolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Initializer/truncated_normal/shapeConst*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
valueB" 
     *
dtype0

rpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Initializer/truncated_normal/meanConst*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
valueB
 *    *
dtype0

tpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Initializer/truncated_normal/stddevConst*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
valueB
 *öģ¶<*
dtype0

}policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalspolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Initializer/truncated_normal/shape*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
dtype0*
seed2*
seedG*
T0
Ū
qpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Initializer/truncated_normal/mulMul}policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Initializer/truncated_normal/TruncatedNormaltpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Initializer/truncated_normal/stddev*
T0*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel
É
mpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Initializer/truncated_normalAddqpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Initializer/truncated_normal/mulrpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Initializer/truncated_normal/mean*
T0*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel

Ppolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel
VariableV2*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
dtype0*
	container *
shape:
 *
shared_name 
¹
Wpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/AssignAssignPpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernelmpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Initializer/truncated_normal*
use_locking(*
T0*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
validate_shape(
”
Upolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/readIdentityPpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
T0*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel
õ
`policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Initializer/zerosConst*a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias*
valueB*    *
dtype0

Npolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias
VariableV2*
shared_name *a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias*
dtype0*
	container *
shape:
¦
Upolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/AssignAssignNpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias`policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Initializer/zeros*
use_locking(*
T0*a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias*
validate_shape(

Spolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/readIdentityNpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias*
T0*a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias

Ppolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMulMatMul,policy/main_graph_0_encoder0/flatten/ReshapeUpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/read*
T0*
transpose_a( *
transpose_b( 
£
Qpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAddBiasAddPpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMulSpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/read*
T0*
data_formatNHWC
ø
Qpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/SigmoidSigmoidQpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd*
T0

Mpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MulMulQpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAddQpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Sigmoid*
T0

spolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Initializer/truncated_normal/shapeConst*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
valueB"      *
dtype0

rpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Initializer/truncated_normal/meanConst*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
valueB
 *    *
dtype0

tpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Initializer/truncated_normal/stddevConst*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
valueB
 *6=*
dtype0

}policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalspolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Initializer/truncated_normal/shape*
seed2*
seedG*
T0*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
dtype0
Ū
qpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Initializer/truncated_normal/mulMul}policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Initializer/truncated_normal/TruncatedNormaltpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Initializer/truncated_normal/stddev*
T0*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel
É
mpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Initializer/truncated_normalAddqpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Initializer/truncated_normal/mulrpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Initializer/truncated_normal/mean*
T0*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel

Ppolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel
VariableV2*
	container *
shape:
*
shared_name *c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
dtype0
¹
Wpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/AssignAssignPpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernelmpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Initializer/truncated_normal*
use_locking(*
T0*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
validate_shape(
”
Upolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/readIdentityPpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
T0*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel
õ
`policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Initializer/zerosConst*a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias*
valueB*    *
dtype0

Npolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias
VariableV2*a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias*
dtype0*
	container *
shape:*
shared_name 
¦
Upolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/AssignAssignNpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias`policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Initializer/zeros*
use_locking(*
T0*a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias*
validate_shape(

Spolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/readIdentityNpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias*
T0*a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias
Æ
Ppolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMulMatMulMpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MulUpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/read*
T0*
transpose_a( *
transpose_b( 
£
Qpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAddBiasAddPpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMulSpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/read*
T0*
data_formatNHWC
ø
Qpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/SigmoidSigmoidQpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd*
T0

Mpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MulMulQpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAddQpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Sigmoid*
T0
B
policy/concat/concat_dimConst*
dtype0*
value	B :
q
policy/concatIdentityMpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul*
T0
F
action_masksPlaceholder*
dtype0*
shape:’’’’’’’’’

6policy/dense/kernel/Initializer/truncated_normal/shapeConst*&
_class
loc:@policy/dense/kernel*
valueB"      *
dtype0

5policy/dense/kernel/Initializer/truncated_normal/meanConst*&
_class
loc:@policy/dense/kernel*
valueB
 *    *
dtype0

7policy/dense/kernel/Initializer/truncated_normal/stddevConst*&
_class
loc:@policy/dense/kernel*
valueB
 *Óč;*
dtype0
ä
@policy/dense/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormal6policy/dense/kernel/Initializer/truncated_normal/shape*
seedG*
T0*&
_class
loc:@policy/dense/kernel*
dtype0*
seed2Ŗ
ē
4policy/dense/kernel/Initializer/truncated_normal/mulMul@policy/dense/kernel/Initializer/truncated_normal/TruncatedNormal7policy/dense/kernel/Initializer/truncated_normal/stddev*&
_class
loc:@policy/dense/kernel*
T0
Õ
0policy/dense/kernel/Initializer/truncated_normalAdd4policy/dense/kernel/Initializer/truncated_normal/mul5policy/dense/kernel/Initializer/truncated_normal/mean*
T0*&
_class
loc:@policy/dense/kernel

policy/dense/kernel
VariableV2*
shared_name *&
_class
loc:@policy/dense/kernel*
dtype0*
	container *
shape:	
Å
policy/dense/kernel/AssignAssignpolicy/dense/kernel0policy/dense/kernel/Initializer/truncated_normal*
use_locking(*
T0*&
_class
loc:@policy/dense/kernel*
validate_shape(
j
policy/dense/kernel/readIdentitypolicy/dense/kernel*
T0*&
_class
loc:@policy/dense/kernel
w
policy_1/dense/MatMulMatMulpolicy/concatpolicy/dense/kernel/read*
transpose_a( *
transpose_b( *
T0
Q
policy_1/strided_slice/stackConst*
valueB"        *
dtype0
S
policy_1/strided_slice/stack_1Const*
valueB"       *
dtype0
S
policy_1/strided_slice/stack_2Const*
valueB"      *
dtype0

policy_1/strided_sliceStridedSliceaction_maskspolicy_1/strided_slice/stackpolicy_1/strided_slice/stack_1policy_1/strided_slice/stack_2*
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask*
T0*
Index0*
shrink_axis_mask 
;
policy_1/SoftmaxSoftmaxpolicy_1/dense/MatMul*
T0
;
policy_1/add/yConst*
dtype0*
valueB
 *æÖ3
>
policy_1/addAddpolicy_1/Softmaxpolicy_1/add/y*
T0
B
policy_1/MulMulpolicy_1/addpolicy_1/strided_slice*
T0
H
policy_1/Sum/reduction_indicesConst*
value	B :*
dtype0
g
policy_1/SumSumpolicy_1/Mulpolicy_1/Sum/reduction_indices*

Tidx0*
	keep_dims(*
T0
@
policy_1/truedivRealDivpolicy_1/Mulpolicy_1/Sum*
T0
=
policy_1/add_1/yConst*
valueB
 *æÖ3*
dtype0
B
policy_1/add_1Addpolicy_1/truedivpolicy_1/add_1/y*
T0
,
policy_1/LogLogpolicy_1/add_1*
T0
V
,policy_1/multinomial/Multinomial/num_samplesConst*
value	B :*
dtype0
£
 policy_1/multinomial/MultinomialMultinomialpolicy_1/Log,policy_1/multinomial/Multinomial/num_samples*
T0*
seed2æ*
seedG*
output_dtype0	
D
policy_1/concat/concat_dimConst*
value	B :*
dtype0
F
policy_1/concatIdentity policy_1/multinomial/Multinomial*
T0	
F
policy_1/concat_1/concat_dimConst*
value	B :*
dtype0
8
policy_1/concat_1Identitypolicy_1/truediv*
T0
=
policy_1/add_2/yConst*
valueB
 *æÖ3*
dtype0
B
policy_1/add_2Addpolicy_1/truedivpolicy_1/add_2/y*
T0
.
policy_1/Log_1Logpolicy_1/add_2*
T0
F
policy_1/concat_2/concat_dimConst*
value	B :*
dtype0
6
policy_1/concat_2Identitypolicy_1/Log_1*
T0
S
policy_1/strided_slice_1/stackConst*
valueB"        *
dtype0
U
 policy_1/strided_slice_1/stack_1Const*
valueB"       *
dtype0
U
 policy_1/strided_slice_1/stack_2Const*
valueB"      *
dtype0

policy_1/strided_slice_1StridedSlicepolicy_1/concatpolicy_1/strided_slice_1/stack policy_1/strided_slice_1/stack_1 policy_1/strided_slice_1/stack_2*
shrink_axis_mask*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*
T0	*
Index0
F
policy_1/one_hot/on_valueConst*
valueB
 *  ?*
dtype0
G
policy_1/one_hot/off_valueConst*
valueB
 *    *
dtype0
@
policy_1/one_hot/depthConst*
value	B :*
dtype0
«
policy_1/one_hotOneHotpolicy_1/strided_slice_1policy_1/one_hot/depthpolicy_1/one_hot/on_valuepolicy_1/one_hot/off_value*
T0*
TI0	*
axis’’’’’’’’’
F
policy_1/concat_3/concat_dimConst*
value	B :*
dtype0
8
policy_1/concat_3Identitypolicy_1/one_hot*
T0
S
policy_1/strided_slice_2/stackConst*
valueB"        *
dtype0
U
 policy_1/strided_slice_2/stack_1Const*
valueB"       *
dtype0
U
 policy_1/strided_slice_2/stack_2Const*
valueB"      *
dtype0

policy_1/strided_slice_2StridedSlicepolicy_1/concat_2policy_1/strided_slice_2/stack policy_1/strided_slice_2/stack_1 policy_1/strided_slice_2/stack_2*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*
Index0*
T0
@
policy_1/Softmax_1Softmaxpolicy_1/strided_slice_2*
T0
S
policy_1/strided_slice_3/stackConst*
valueB"        *
dtype0
U
 policy_1/strided_slice_3/stack_1Const*
valueB"       *
dtype0
U
 policy_1/strided_slice_3/stack_2Const*
valueB"      *
dtype0

policy_1/strided_slice_3StridedSlicepolicy_1/concat_2policy_1/strided_slice_3/stack policy_1/strided_slice_3/stack_1 policy_1/strided_slice_3/stack_2*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
Y
/policy_1/softmax_cross_entropy_with_logits/RankConst*
dtype0*
value	B :
l
0policy_1/softmax_cross_entropy_with_logits/ShapeShapepolicy_1/strided_slice_3*
T0*
out_type0
[
1policy_1/softmax_cross_entropy_with_logits/Rank_1Const*
value	B :*
dtype0
n
2policy_1/softmax_cross_entropy_with_logits/Shape_1Shapepolicy_1/strided_slice_3*
T0*
out_type0
Z
0policy_1/softmax_cross_entropy_with_logits/Sub/yConst*
value	B :*
dtype0
£
.policy_1/softmax_cross_entropy_with_logits/SubSub1policy_1/softmax_cross_entropy_with_logits/Rank_10policy_1/softmax_cross_entropy_with_logits/Sub/y*
T0

6policy_1/softmax_cross_entropy_with_logits/Slice/beginPack.policy_1/softmax_cross_entropy_with_logits/Sub*
T0*

axis *
N
c
5policy_1/softmax_cross_entropy_with_logits/Slice/sizeConst*
valueB:*
dtype0
ņ
0policy_1/softmax_cross_entropy_with_logits/SliceSlice2policy_1/softmax_cross_entropy_with_logits/Shape_16policy_1/softmax_cross_entropy_with_logits/Slice/begin5policy_1/softmax_cross_entropy_with_logits/Slice/size*
T0*
Index0
q
:policy_1/softmax_cross_entropy_with_logits/concat/values_0Const*
valueB:
’’’’’’’’’*
dtype0
`
6policy_1/softmax_cross_entropy_with_logits/concat/axisConst*
value	B : *
dtype0

1policy_1/softmax_cross_entropy_with_logits/concatConcatV2:policy_1/softmax_cross_entropy_with_logits/concat/values_00policy_1/softmax_cross_entropy_with_logits/Slice6policy_1/softmax_cross_entropy_with_logits/concat/axis*
T0*
N*

Tidx0
”
2policy_1/softmax_cross_entropy_with_logits/ReshapeReshapepolicy_1/strided_slice_31policy_1/softmax_cross_entropy_with_logits/concat*
T0*
Tshape0
[
1policy_1/softmax_cross_entropy_with_logits/Rank_2Const*
value	B :*
dtype0
h
2policy_1/softmax_cross_entropy_with_logits/Shape_2Shapepolicy_1/Softmax_1*
T0*
out_type0
\
2policy_1/softmax_cross_entropy_with_logits/Sub_1/yConst*
value	B :*
dtype0
§
0policy_1/softmax_cross_entropy_with_logits/Sub_1Sub1policy_1/softmax_cross_entropy_with_logits/Rank_22policy_1/softmax_cross_entropy_with_logits/Sub_1/y*
T0

8policy_1/softmax_cross_entropy_with_logits/Slice_1/beginPack0policy_1/softmax_cross_entropy_with_logits/Sub_1*
T0*

axis *
N
e
7policy_1/softmax_cross_entropy_with_logits/Slice_1/sizeConst*
dtype0*
valueB:
ų
2policy_1/softmax_cross_entropy_with_logits/Slice_1Slice2policy_1/softmax_cross_entropy_with_logits/Shape_28policy_1/softmax_cross_entropy_with_logits/Slice_1/begin7policy_1/softmax_cross_entropy_with_logits/Slice_1/size*
T0*
Index0
s
<policy_1/softmax_cross_entropy_with_logits/concat_1/values_0Const*
valueB:
’’’’’’’’’*
dtype0
b
8policy_1/softmax_cross_entropy_with_logits/concat_1/axisConst*
value	B : *
dtype0

3policy_1/softmax_cross_entropy_with_logits/concat_1ConcatV2<policy_1/softmax_cross_entropy_with_logits/concat_1/values_02policy_1/softmax_cross_entropy_with_logits/Slice_18policy_1/softmax_cross_entropy_with_logits/concat_1/axis*
T0*
N*

Tidx0

4policy_1/softmax_cross_entropy_with_logits/Reshape_1Reshapepolicy_1/Softmax_13policy_1/softmax_cross_entropy_with_logits/concat_1*
T0*
Tshape0
¾
*policy_1/softmax_cross_entropy_with_logitsSoftmaxCrossEntropyWithLogits2policy_1/softmax_cross_entropy_with_logits/Reshape4policy_1/softmax_cross_entropy_with_logits/Reshape_1*
T0
\
2policy_1/softmax_cross_entropy_with_logits/Sub_2/yConst*
value	B :*
dtype0
„
0policy_1/softmax_cross_entropy_with_logits/Sub_2Sub/policy_1/softmax_cross_entropy_with_logits/Rank2policy_1/softmax_cross_entropy_with_logits/Sub_2/y*
T0
f
8policy_1/softmax_cross_entropy_with_logits/Slice_2/beginConst*
valueB: *
dtype0

7policy_1/softmax_cross_entropy_with_logits/Slice_2/sizePack0policy_1/softmax_cross_entropy_with_logits/Sub_2*
T0*

axis *
N
ö
2policy_1/softmax_cross_entropy_with_logits/Slice_2Slice0policy_1/softmax_cross_entropy_with_logits/Shape8policy_1/softmax_cross_entropy_with_logits/Slice_2/begin7policy_1/softmax_cross_entropy_with_logits/Slice_2/size*
T0*
Index0
¶
4policy_1/softmax_cross_entropy_with_logits/Reshape_2Reshape*policy_1/softmax_cross_entropy_with_logits2policy_1/softmax_cross_entropy_with_logits/Slice_2*
T0*
Tshape0
j
policy_1/stackPack4policy_1/softmax_cross_entropy_with_logits/Reshape_2*
T0*

axis*
N
J
 policy_1/Sum_1/reduction_indicesConst*
value	B :*
dtype0
m
policy_1/Sum_1Sumpolicy_1/stack policy_1/Sum_1/reduction_indices*
T0*

Tidx0*
	keep_dims( 
S
policy_1/strided_slice_4/stackConst*
valueB"        *
dtype0
U
 policy_1/strided_slice_4/stack_1Const*
valueB"       *
dtype0
U
 policy_1/strided_slice_4/stack_2Const*
valueB"      *
dtype0

policy_1/strided_slice_4StridedSlicepolicy_1/concat_3policy_1/strided_slice_4/stack policy_1/strided_slice_4/stack_1 policy_1/strided_slice_4/stack_2*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*
Index0*
T0
S
policy_1/strided_slice_5/stackConst*
valueB"        *
dtype0
U
 policy_1/strided_slice_5/stack_1Const*
valueB"       *
dtype0
U
 policy_1/strided_slice_5/stack_2Const*
valueB"      *
dtype0

policy_1/strided_slice_5StridedSlicepolicy_1/concat_2policy_1/strided_slice_5/stack policy_1/strided_slice_5/stack_1 policy_1/strided_slice_5/stack_2*
end_mask*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask 
[
1policy_1/softmax_cross_entropy_with_logits_1/RankConst*
value	B :*
dtype0
n
2policy_1/softmax_cross_entropy_with_logits_1/ShapeShapepolicy_1/strided_slice_5*
T0*
out_type0
]
3policy_1/softmax_cross_entropy_with_logits_1/Rank_1Const*
value	B :*
dtype0
p
4policy_1/softmax_cross_entropy_with_logits_1/Shape_1Shapepolicy_1/strided_slice_5*
T0*
out_type0
\
2policy_1/softmax_cross_entropy_with_logits_1/Sub/yConst*
value	B :*
dtype0
©
0policy_1/softmax_cross_entropy_with_logits_1/SubSub3policy_1/softmax_cross_entropy_with_logits_1/Rank_12policy_1/softmax_cross_entropy_with_logits_1/Sub/y*
T0

8policy_1/softmax_cross_entropy_with_logits_1/Slice/beginPack0policy_1/softmax_cross_entropy_with_logits_1/Sub*
T0*

axis *
N
e
7policy_1/softmax_cross_entropy_with_logits_1/Slice/sizeConst*
valueB:*
dtype0
ś
2policy_1/softmax_cross_entropy_with_logits_1/SliceSlice4policy_1/softmax_cross_entropy_with_logits_1/Shape_18policy_1/softmax_cross_entropy_with_logits_1/Slice/begin7policy_1/softmax_cross_entropy_with_logits_1/Slice/size*
T0*
Index0
s
<policy_1/softmax_cross_entropy_with_logits_1/concat/values_0Const*
valueB:
’’’’’’’’’*
dtype0
b
8policy_1/softmax_cross_entropy_with_logits_1/concat/axisConst*
value	B : *
dtype0

3policy_1/softmax_cross_entropy_with_logits_1/concatConcatV2<policy_1/softmax_cross_entropy_with_logits_1/concat/values_02policy_1/softmax_cross_entropy_with_logits_1/Slice8policy_1/softmax_cross_entropy_with_logits_1/concat/axis*

Tidx0*
T0*
N
„
4policy_1/softmax_cross_entropy_with_logits_1/ReshapeReshapepolicy_1/strided_slice_53policy_1/softmax_cross_entropy_with_logits_1/concat*
T0*
Tshape0
]
3policy_1/softmax_cross_entropy_with_logits_1/Rank_2Const*
dtype0*
value	B :
p
4policy_1/softmax_cross_entropy_with_logits_1/Shape_2Shapepolicy_1/strided_slice_4*
T0*
out_type0
^
4policy_1/softmax_cross_entropy_with_logits_1/Sub_1/yConst*
dtype0*
value	B :
­
2policy_1/softmax_cross_entropy_with_logits_1/Sub_1Sub3policy_1/softmax_cross_entropy_with_logits_1/Rank_24policy_1/softmax_cross_entropy_with_logits_1/Sub_1/y*
T0

:policy_1/softmax_cross_entropy_with_logits_1/Slice_1/beginPack2policy_1/softmax_cross_entropy_with_logits_1/Sub_1*
T0*

axis *
N
g
9policy_1/softmax_cross_entropy_with_logits_1/Slice_1/sizeConst*
valueB:*
dtype0

4policy_1/softmax_cross_entropy_with_logits_1/Slice_1Slice4policy_1/softmax_cross_entropy_with_logits_1/Shape_2:policy_1/softmax_cross_entropy_with_logits_1/Slice_1/begin9policy_1/softmax_cross_entropy_with_logits_1/Slice_1/size*
T0*
Index0
u
>policy_1/softmax_cross_entropy_with_logits_1/concat_1/values_0Const*
valueB:
’’’’’’’’’*
dtype0
d
:policy_1/softmax_cross_entropy_with_logits_1/concat_1/axisConst*
value	B : *
dtype0

5policy_1/softmax_cross_entropy_with_logits_1/concat_1ConcatV2>policy_1/softmax_cross_entropy_with_logits_1/concat_1/values_04policy_1/softmax_cross_entropy_with_logits_1/Slice_1:policy_1/softmax_cross_entropy_with_logits_1/concat_1/axis*

Tidx0*
T0*
N
©
6policy_1/softmax_cross_entropy_with_logits_1/Reshape_1Reshapepolicy_1/strided_slice_45policy_1/softmax_cross_entropy_with_logits_1/concat_1*
Tshape0*
T0
Ä
,policy_1/softmax_cross_entropy_with_logits_1SoftmaxCrossEntropyWithLogits4policy_1/softmax_cross_entropy_with_logits_1/Reshape6policy_1/softmax_cross_entropy_with_logits_1/Reshape_1*
T0
^
4policy_1/softmax_cross_entropy_with_logits_1/Sub_2/yConst*
value	B :*
dtype0
«
2policy_1/softmax_cross_entropy_with_logits_1/Sub_2Sub1policy_1/softmax_cross_entropy_with_logits_1/Rank4policy_1/softmax_cross_entropy_with_logits_1/Sub_2/y*
T0
h
:policy_1/softmax_cross_entropy_with_logits_1/Slice_2/beginConst*
valueB: *
dtype0

9policy_1/softmax_cross_entropy_with_logits_1/Slice_2/sizePack2policy_1/softmax_cross_entropy_with_logits_1/Sub_2*
T0*

axis *
N
ž
4policy_1/softmax_cross_entropy_with_logits_1/Slice_2Slice2policy_1/softmax_cross_entropy_with_logits_1/Shape:policy_1/softmax_cross_entropy_with_logits_1/Slice_2/begin9policy_1/softmax_cross_entropy_with_logits_1/Slice_2/size*
T0*
Index0
¼
6policy_1/softmax_cross_entropy_with_logits_1/Reshape_2Reshape,policy_1/softmax_cross_entropy_with_logits_14policy_1/softmax_cross_entropy_with_logits_1/Slice_2*
T0*
Tshape0
T
policy_1/NegNeg6policy_1/softmax_cross_entropy_with_logits_1/Reshape_2*
T0
D
policy_1/stack_1Packpolicy_1/Neg*
N*
T0*

axis
J
 policy_1/Sum_2/reduction_indicesConst*
value	B :*
dtype0
o
policy_1/Sum_2Sumpolicy_1/stack_1 policy_1/Sum_2/reduction_indices*

Tidx0*
	keep_dims(*
T0
.
actionIdentitypolicy_1/concat_2*
T0
8
StopGradientStopGradientpolicy_1/concat_3*
T0
A
save/filename/inputConst*
valueB Bmodel*
dtype0
V
save/filenamePlaceholderWithDefaultsave/filename/input*
dtype0*
shape: 
M

save/ConstPlaceholderWithDefaultsave/filename*
dtype0*
shape: 

save/SaveV2/tensor_namesConst*ź
valueąBŻBaction_output_shapeBglobal_stepBis_continuous_controlBmemory_sizeBnormalization_stepsBpolicy/dense/kernelB(policy/main_graph_0_encoder0/conv_1/biasB*policy/main_graph_0_encoder0/conv_1/kernelB(policy/main_graph_0_encoder0/conv_2/biasB*policy/main_graph_0_encoder0/conv_2/kernelBNpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/biasBPpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernelBNpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/biasBPpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernelBrunning_meanBrunning_varianceBtrainer_major_versionBtrainer_minor_versionBtrainer_patch_versionBversion_number*
dtype0
o
save/SaveV2/shape_and_slicesConst*;
value2B0B B B B B B B B B B B B B B B B B B B B *
dtype0
Ņ
save/SaveV2SaveV2
save/Constsave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesaction_output_shapeglobal_stepis_continuous_controlmemory_sizenormalization_stepspolicy/dense/kernel(policy/main_graph_0_encoder0/conv_1/bias*policy/main_graph_0_encoder0/conv_1/kernel(policy/main_graph_0_encoder0/conv_2/bias*policy/main_graph_0_encoder0/conv_2/kernelNpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/biasPpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernelNpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/biasPpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernelrunning_meanrunning_variancetrainer_major_versiontrainer_minor_versiontrainer_patch_versionversion_number*"
dtypes
2
e
save/control_dependencyIdentity
save/Const^save/SaveV2*
T0*
_class
loc:@save/Const
­
save/RestoreV2/tensor_namesConst"/device:CPU:0*ź
valueąBŻBaction_output_shapeBglobal_stepBis_continuous_controlBmemory_sizeBnormalization_stepsBpolicy/dense/kernelB(policy/main_graph_0_encoder0/conv_1/biasB*policy/main_graph_0_encoder0/conv_1/kernelB(policy/main_graph_0_encoder0/conv_2/biasB*policy/main_graph_0_encoder0/conv_2/kernelBNpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/biasBPpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernelBNpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/biasBPpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernelBrunning_meanBrunning_varianceBtrainer_major_versionBtrainer_minor_versionBtrainer_patch_versionBversion_number*
dtype0

save/RestoreV2/shape_and_slicesConst"/device:CPU:0*;
value2B0B B B B B B B B B B B B B B B B B B B B *
dtype0

save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*"
dtypes
2

save/AssignAssignaction_output_shapesave/RestoreV2*
use_locking(*
T0*&
_class
loc:@action_output_shape*
validate_shape(

save/Assign_1Assignglobal_stepsave/RestoreV2:1*
validate_shape(*
use_locking(*
T0*
_class
loc:@global_step

save/Assign_2Assignis_continuous_controlsave/RestoreV2:2*
use_locking(*
T0*(
_class
loc:@is_continuous_control*
validate_shape(

save/Assign_3Assignmemory_sizesave/RestoreV2:3*
use_locking(*
T0*
_class
loc:@memory_size*
validate_shape(

save/Assign_4Assignnormalization_stepssave/RestoreV2:4*&
_class
loc:@normalization_steps*
validate_shape(*
use_locking(*
T0

save/Assign_5Assignpolicy/dense/kernelsave/RestoreV2:5*&
_class
loc:@policy/dense/kernel*
validate_shape(*
use_locking(*
T0
Ā
save/Assign_6Assign(policy/main_graph_0_encoder0/conv_1/biassave/RestoreV2:6*;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_1/bias*
validate_shape(*
use_locking(*
T0
Ę
save/Assign_7Assign*policy/main_graph_0_encoder0/conv_1/kernelsave/RestoreV2:7*
use_locking(*
T0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_1/kernel*
validate_shape(
Ā
save/Assign_8Assign(policy/main_graph_0_encoder0/conv_2/biassave/RestoreV2:8*;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_2/bias*
validate_shape(*
use_locking(*
T0
Ę
save/Assign_9Assign*policy/main_graph_0_encoder0/conv_2/kernelsave/RestoreV2:9*
use_locking(*
T0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_2/kernel*
validate_shape(

save/Assign_10AssignNpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/biassave/RestoreV2:10*
T0*a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias*
validate_shape(*
use_locking(

save/Assign_11AssignPpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernelsave/RestoreV2:11*
validate_shape(*
use_locking(*
T0*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel

save/Assign_12AssignNpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/biassave/RestoreV2:12*
use_locking(*
T0*a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias*
validate_shape(

save/Assign_13AssignPpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernelsave/RestoreV2:13*
use_locking(*
T0*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
validate_shape(

save/Assign_14Assignrunning_meansave/RestoreV2:14*
T0*
_class
loc:@running_mean*
validate_shape(*
use_locking(

save/Assign_15Assignrunning_variancesave/RestoreV2:15*
T0*#
_class
loc:@running_variance*
validate_shape(*
use_locking(

save/Assign_16Assigntrainer_major_versionsave/RestoreV2:16*
use_locking(*
T0*(
_class
loc:@trainer_major_version*
validate_shape(

save/Assign_17Assigntrainer_minor_versionsave/RestoreV2:17*
use_locking(*
T0*(
_class
loc:@trainer_minor_version*
validate_shape(

save/Assign_18Assigntrainer_patch_versionsave/RestoreV2:18*(
_class
loc:@trainer_patch_version*
validate_shape(*
use_locking(*
T0

save/Assign_19Assignversion_numbersave/RestoreV2:19*
validate_shape(*
use_locking(*
T0*!
_class
loc:@version_number
ą
save/restore_allNoOp^save/Assign^save/Assign_1^save/Assign_10^save/Assign_11^save/Assign_12^save/Assign_13^save/Assign_14^save/Assign_15^save/Assign_16^save/Assign_17^save/Assign_18^save/Assign_19^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8^save/Assign_9

initNoOp^action_output_shape/Assign^global_step/Assign^is_continuous_control/Assign^memory_size/Assign^normalization_steps/Assign^policy/dense/kernel/Assign0^policy/main_graph_0_encoder0/conv_1/bias/Assign2^policy/main_graph_0_encoder0/conv_1/kernel/Assign0^policy/main_graph_0_encoder0/conv_2/bias/Assign2^policy/main_graph_0_encoder0/conv_2/kernel/AssignV^policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/AssignX^policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/AssignV^policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/AssignX^policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Assign^running_mean/Assign^running_variance/Assign^trainer_major_version/Assign^trainer_minor_version/Assign^trainer_patch_version/Assign^version_number/Assign
Ļ
Ooptimizer//main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniform/shapeConst*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_1/kernel*%
valueB"            *
dtype0
½
Moptimizer//main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniform/minConst*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_1/kernel*
valueB
 *0½*
dtype0
½
Moptimizer//main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniform/maxConst*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_1/kernel*
valueB
 *0=*
dtype0
­
Woptimizer//main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniform/RandomUniformRandomUniformOoptimizer//main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniform/shape*
T0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_1/kernel*
dtype0*
seed2Ļ*
seedG
¾
Moptimizer//main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniform/subSubMoptimizer//main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniform/maxMoptimizer//main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniform/min*
T0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_1/kernel
Č
Moptimizer//main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniform/mulMulWoptimizer//main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniform/RandomUniformMoptimizer//main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniform/sub*
T0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_1/kernel
ŗ
Ioptimizer//main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniformAddMoptimizer//main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniform/mulMoptimizer//main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniform/min*
T0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_1/kernel
Ķ
.optimizer//main_graph_0_encoder0/conv_1/kernel
VariableV2*
dtype0*
	container *
shape:*
shared_name *A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_1/kernel
Æ
5optimizer//main_graph_0_encoder0/conv_1/kernel/AssignAssign.optimizer//main_graph_0_encoder0/conv_1/kernelIoptimizer//main_graph_0_encoder0/conv_1/kernel/Initializer/random_uniform*
use_locking(*
T0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_1/kernel*
validate_shape(
»
3optimizer//main_graph_0_encoder0/conv_1/kernel/readIdentity.optimizer//main_graph_0_encoder0/conv_1/kernel*
T0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_1/kernel
°
>optimizer//main_graph_0_encoder0/conv_1/bias/Initializer/zerosConst*?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_1/bias*
valueB*    *
dtype0
½
,optimizer//main_graph_0_encoder0/conv_1/bias
VariableV2*?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_1/bias*
dtype0*
	container *
shape:*
shared_name 

3optimizer//main_graph_0_encoder0/conv_1/bias/AssignAssign,optimizer//main_graph_0_encoder0/conv_1/bias>optimizer//main_graph_0_encoder0/conv_1/bias/Initializer/zeros*
use_locking(*
T0*?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_1/bias*
validate_shape(
µ
1optimizer//main_graph_0_encoder0/conv_1/bias/readIdentity,optimizer//main_graph_0_encoder0/conv_1/bias*
T0*?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_1/bias
i
4optimizer/main_graph_0_encoder0/conv_1/dilation_rateConst*
valueB"      *
dtype0

-optimizer/main_graph_0_encoder0/conv_1/Conv2DConv2Dvisual_observation_03optimizer//main_graph_0_encoder0/conv_1/kernel/read*
T0*
strides
*
data_formatNHWC*
use_cudnn_on_gpu(*
explicit_paddings
 *
paddingVALID*
	dilations

»
.optimizer/main_graph_0_encoder0/conv_1/BiasAddBiasAdd-optimizer/main_graph_0_encoder0/conv_1/Conv2D1optimizer//main_graph_0_encoder0/conv_1/bias/read*
data_formatNHWC*
T0
j
*optimizer/main_graph_0_encoder0/conv_1/EluElu.optimizer/main_graph_0_encoder0/conv_1/BiasAdd*
T0
Ļ
Ooptimizer//main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniform/shapeConst*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_2/kernel*%
valueB"             *
dtype0
½
Moptimizer//main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniform/minConst*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_2/kernel*
valueB
 *óµ½*
dtype0
½
Moptimizer//main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniform/maxConst*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_2/kernel*
valueB
 *óµ=*
dtype0
­
Woptimizer//main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniform/RandomUniformRandomUniformOoptimizer//main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniform/shape*
T0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_2/kernel*
dtype0*
seed2į*
seedG
¾
Moptimizer//main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniform/subSubMoptimizer//main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniform/maxMoptimizer//main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniform/min*
T0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_2/kernel
Č
Moptimizer//main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniform/mulMulWoptimizer//main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniform/RandomUniformMoptimizer//main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniform/sub*
T0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_2/kernel
ŗ
Ioptimizer//main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniformAddMoptimizer//main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniform/mulMoptimizer//main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniform/min*
T0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_2/kernel
Ķ
.optimizer//main_graph_0_encoder0/conv_2/kernel
VariableV2*
shape: *
shared_name *A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_2/kernel*
dtype0*
	container 
Æ
5optimizer//main_graph_0_encoder0/conv_2/kernel/AssignAssign.optimizer//main_graph_0_encoder0/conv_2/kernelIoptimizer//main_graph_0_encoder0/conv_2/kernel/Initializer/random_uniform*
use_locking(*
T0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_2/kernel*
validate_shape(
»
3optimizer//main_graph_0_encoder0/conv_2/kernel/readIdentity.optimizer//main_graph_0_encoder0/conv_2/kernel*
T0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_2/kernel
°
>optimizer//main_graph_0_encoder0/conv_2/bias/Initializer/zerosConst*?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_2/bias*
valueB *    *
dtype0
½
,optimizer//main_graph_0_encoder0/conv_2/bias
VariableV2*
dtype0*
	container *
shape: *
shared_name *?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_2/bias

3optimizer//main_graph_0_encoder0/conv_2/bias/AssignAssign,optimizer//main_graph_0_encoder0/conv_2/bias>optimizer//main_graph_0_encoder0/conv_2/bias/Initializer/zeros*
T0*?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_2/bias*
validate_shape(*
use_locking(
µ
1optimizer//main_graph_0_encoder0/conv_2/bias/readIdentity,optimizer//main_graph_0_encoder0/conv_2/bias*
T0*?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_2/bias
i
4optimizer/main_graph_0_encoder0/conv_2/dilation_rateConst*
valueB"      *
dtype0
©
-optimizer/main_graph_0_encoder0/conv_2/Conv2DConv2D*optimizer/main_graph_0_encoder0/conv_1/Elu3optimizer//main_graph_0_encoder0/conv_2/kernel/read*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
explicit_paddings
 *
paddingVALID*
	dilations
*
T0
»
.optimizer/main_graph_0_encoder0/conv_2/BiasAddBiasAdd-optimizer/main_graph_0_encoder0/conv_2/Conv2D1optimizer//main_graph_0_encoder0/conv_2/bias/read*
data_formatNHWC*
T0
j
*optimizer/main_graph_0_encoder0/conv_2/EluElu.optimizer/main_graph_0_encoder0/conv_2/BiasAdd*
T0
{
-optimizer/main_graph_0_encoder0/flatten/ShapeShape*optimizer/main_graph_0_encoder0/conv_2/Elu*
T0*
out_type0
i
;optimizer/main_graph_0_encoder0/flatten/strided_slice/stackConst*
valueB: *
dtype0
k
=optimizer/main_graph_0_encoder0/flatten/strided_slice/stack_1Const*
valueB:*
dtype0
k
=optimizer/main_graph_0_encoder0/flatten/strided_slice/stack_2Const*
valueB:*
dtype0
©
5optimizer/main_graph_0_encoder0/flatten/strided_sliceStridedSlice-optimizer/main_graph_0_encoder0/flatten/Shape;optimizer/main_graph_0_encoder0/flatten/strided_slice/stack=optimizer/main_graph_0_encoder0/flatten/strided_slice/stack_1=optimizer/main_graph_0_encoder0/flatten/strided_slice/stack_2*
end_mask *
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask 
j
7optimizer/main_graph_0_encoder0/flatten/Reshape/shape/1Const*
valueB :
’’’’’’’’’*
dtype0
Ė
5optimizer/main_graph_0_encoder0/flatten/Reshape/shapePack5optimizer/main_graph_0_encoder0/flatten/strided_slice7optimizer/main_graph_0_encoder0/flatten/Reshape/shape/1*
T0*

axis *
N
“
/optimizer/main_graph_0_encoder0/flatten/ReshapeReshape*optimizer/main_graph_0_encoder0/conv_2/Elu5optimizer/main_graph_0_encoder0/flatten/Reshape/shape*
T0*
Tshape0

woptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Initializer/truncated_normal/shapeConst*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
valueB" 
     *
dtype0

voptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Initializer/truncated_normal/meanConst*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
valueB
 *    *
dtype0

xoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Initializer/truncated_normal/stddevConst*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
valueB
 *öģ¶<*
dtype0
Ø
optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalwoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Initializer/truncated_normal/shape*
seed2ū*
seedG*
T0*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
dtype0
ģ
uoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Initializer/truncated_normal/mulMuloptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Initializer/truncated_normal/TruncatedNormalxoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Initializer/truncated_normal/stddev*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
T0
Ł
qoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Initializer/truncated_normalAdduoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Initializer/truncated_normal/mulvoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Initializer/truncated_normal/mean*
T0*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel

Toptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel
VariableV2*
	container *
shape:
 *
shared_name *g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
dtype0
É
[optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/AssignAssignToptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernelqoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Initializer/truncated_normal*
use_locking(*
T0*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
validate_shape(
­
Yoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/readIdentityToptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
T0
ż
doptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Initializer/zerosConst*e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias*
valueB*    *
dtype0

Roptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias
VariableV2*e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias*
dtype0*
	container *
shape:*
shared_name 
¶
Yoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/AssignAssignRoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/biasdoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Initializer/zeros*
use_locking(*
T0*e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias*
validate_shape(
§
Woptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/readIdentityRoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias*
T0*e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias

Soptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMulMatMul/optimizer/main_graph_0_encoder0/flatten/ReshapeYoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/read*
T0*
transpose_a( *
transpose_b( 
­
Toptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAddBiasAddSoptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMulWoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/read*
data_formatNHWC*
T0
¾
Toptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/SigmoidSigmoidToptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd*
T0

Poptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MulMulToptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAddToptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Sigmoid*
T0

woptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Initializer/truncated_normal/shapeConst*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
valueB"      *
dtype0

voptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Initializer/truncated_normal/meanConst*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
valueB
 *    *
dtype0

xoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Initializer/truncated_normal/stddevConst*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
valueB
 *6=*
dtype0
Ø
optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalwoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Initializer/truncated_normal/shape*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
dtype0*
seed2*
seedG*
T0
ģ
uoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Initializer/truncated_normal/mulMuloptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Initializer/truncated_normal/TruncatedNormalxoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Initializer/truncated_normal/stddev*
T0*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel
Ł
qoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Initializer/truncated_normalAdduoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Initializer/truncated_normal/mulvoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Initializer/truncated_normal/mean*
T0*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel

Toptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel
VariableV2*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
dtype0*
	container *
shape:
*
shared_name 
É
[optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/AssignAssignToptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernelqoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Initializer/truncated_normal*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
validate_shape(*
use_locking(*
T0
­
Yoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/readIdentityToptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
T0*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel
ż
doptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Initializer/zerosConst*
dtype0*e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias*
valueB*    

Roptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias
VariableV2*
shared_name *e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias*
dtype0*
	container *
shape:
¶
Yoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/AssignAssignRoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/biasdoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Initializer/zeros*
use_locking(*
T0*e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias*
validate_shape(
§
Woptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/readIdentityRoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias*
T0*e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias
¹
Soptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMulMatMulPoptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MulYoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/read*
transpose_a( *
transpose_b( *
T0
­
Toptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAddBiasAddSoptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMulWoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/read*
T0*
data_formatNHWC
¾
Toptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/SigmoidSigmoidToptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd*
T0

Poptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MulMulToptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAddToptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Sigmoid*
T0
E
optimizer/concat/concat_dimConst*
dtype0*
value	B :
w
optimizer/concatIdentityPoptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul*
T0
­
Boptimizer//extrinsic_value/kernel/Initializer/random_uniform/shapeConst*4
_class*
(&loc:@optimizer//extrinsic_value/kernel*
valueB"      *
dtype0
£
@optimizer//extrinsic_value/kernel/Initializer/random_uniform/minConst*4
_class*
(&loc:@optimizer//extrinsic_value/kernel*
valueB
 *Iv¾*
dtype0
£
@optimizer//extrinsic_value/kernel/Initializer/random_uniform/maxConst*4
_class*
(&loc:@optimizer//extrinsic_value/kernel*
valueB
 *Iv>*
dtype0

Joptimizer//extrinsic_value/kernel/Initializer/random_uniform/RandomUniformRandomUniformBoptimizer//extrinsic_value/kernel/Initializer/random_uniform/shape*
dtype0*
seed2*
seedG*
T0*4
_class*
(&loc:@optimizer//extrinsic_value/kernel

@optimizer//extrinsic_value/kernel/Initializer/random_uniform/subSub@optimizer//extrinsic_value/kernel/Initializer/random_uniform/max@optimizer//extrinsic_value/kernel/Initializer/random_uniform/min*
T0*4
_class*
(&loc:@optimizer//extrinsic_value/kernel

@optimizer//extrinsic_value/kernel/Initializer/random_uniform/mulMulJoptimizer//extrinsic_value/kernel/Initializer/random_uniform/RandomUniform@optimizer//extrinsic_value/kernel/Initializer/random_uniform/sub*
T0*4
_class*
(&loc:@optimizer//extrinsic_value/kernel

<optimizer//extrinsic_value/kernel/Initializer/random_uniformAdd@optimizer//extrinsic_value/kernel/Initializer/random_uniform/mul@optimizer//extrinsic_value/kernel/Initializer/random_uniform/min*
T0*4
_class*
(&loc:@optimizer//extrinsic_value/kernel
¬
!optimizer//extrinsic_value/kernel
VariableV2*4
_class*
(&loc:@optimizer//extrinsic_value/kernel*
dtype0*
	container *
shape:	*
shared_name 
ū
(optimizer//extrinsic_value/kernel/AssignAssign!optimizer//extrinsic_value/kernel<optimizer//extrinsic_value/kernel/Initializer/random_uniform*
use_locking(*
T0*4
_class*
(&loc:@optimizer//extrinsic_value/kernel*
validate_shape(

&optimizer//extrinsic_value/kernel/readIdentity!optimizer//extrinsic_value/kernel*
T0*4
_class*
(&loc:@optimizer//extrinsic_value/kernel

1optimizer//extrinsic_value/bias/Initializer/zerosConst*2
_class(
&$loc:@optimizer//extrinsic_value/bias*
valueB*    *
dtype0
£
optimizer//extrinsic_value/bias
VariableV2*2
_class(
&$loc:@optimizer//extrinsic_value/bias*
dtype0*
	container *
shape:*
shared_name 
ź
&optimizer//extrinsic_value/bias/AssignAssignoptimizer//extrinsic_value/bias1optimizer//extrinsic_value/bias/Initializer/zeros*
use_locking(*
T0*2
_class(
&$loc:@optimizer//extrinsic_value/bias*
validate_shape(

$optimizer//extrinsic_value/bias/readIdentityoptimizer//extrinsic_value/bias*
T0*2
_class(
&$loc:@optimizer//extrinsic_value/bias

 optimizer/extrinsic_value/MatMulMatMuloptimizer/concat&optimizer//extrinsic_value/kernel/read*
T0*
transpose_a( *
transpose_b( 

!optimizer/extrinsic_value/BiasAddBiasAdd optimizer/extrinsic_value/MatMul$optimizer//extrinsic_value/bias/read*
data_formatNHWC*
T0
]
optimizer/Mean/inputPack!optimizer/extrinsic_value/BiasAdd*
T0*

axis *
N
J
 optimizer/Mean/reduction_indicesConst*
value	B : *
dtype0
t
optimizer/MeanMeanoptimizer/Mean/input optimizer/Mean/reduction_indices*
T0*

Tidx0*
	keep_dims( 
U
optimizer/old_probabilitiesPlaceholder*
shape:’’’’’’’’’*
dtype0
R
optimizer/strided_slice/stackConst*
dtype0*
valueB"        
T
optimizer/strided_slice/stack_1Const*
valueB"       *
dtype0
T
optimizer/strided_slice/stack_2Const*
valueB"      *
dtype0

optimizer/strided_sliceStridedSliceoptimizer/old_probabilitiesoptimizer/strided_slice/stackoptimizer/strided_slice/stack_1optimizer/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
T
optimizer/strided_slice_1/stackConst*
dtype0*
valueB"        
V
!optimizer/strided_slice_1/stack_1Const*
dtype0*
valueB"       
V
!optimizer/strided_slice_1/stack_2Const*
valueB"      *
dtype0

optimizer/strided_slice_1StridedSliceaction_masksoptimizer/strided_slice_1/stack!optimizer/strided_slice_1/stack_1!optimizer/strided_slice_1/stack_2*
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask*
T0*
Index0*
shrink_axis_mask 
>
optimizer/SoftmaxSoftmaxoptimizer/strided_slice*
T0
<
optimizer/add/yConst*
dtype0*
valueB
 *æÖ3
A
optimizer/addAddoptimizer/Softmaxoptimizer/add/y*
T0
G
optimizer/MulMuloptimizer/addoptimizer/strided_slice_1*
T0
I
optimizer/Sum/reduction_indicesConst*
value	B :*
dtype0
j
optimizer/SumSumoptimizer/Muloptimizer/Sum/reduction_indices*

Tidx0*
	keep_dims(*
T0
C
optimizer/truedivRealDivoptimizer/Muloptimizer/Sum*
T0
>
optimizer/add_1/yConst*
dtype0*
valueB
 *æÖ3
E
optimizer/add_1Addoptimizer/truedivoptimizer/add_1/y*
T0
.
optimizer/LogLogoptimizer/add_1*
T0
W
-optimizer/multinomial/Multinomial/num_samplesConst*
value	B :*
dtype0
¦
!optimizer/multinomial/MultinomialMultinomialoptimizer/Log-optimizer/multinomial/Multinomial/num_samples*
seedG*
output_dtype0	*
T0*
seed2Ā
G
optimizer/concat_1/concat_dimConst*
value	B :*
dtype0
J
optimizer/concat_1Identity!optimizer/multinomial/Multinomial*
T0	
G
optimizer/concat_2/concat_dimConst*
value	B :*
dtype0
:
optimizer/concat_2Identityoptimizer/truediv*
T0
>
optimizer/add_2/yConst*
valueB
 *æÖ3*
dtype0
E
optimizer/add_2Addoptimizer/truedivoptimizer/add_2/y*
T0
0
optimizer/Log_1Logoptimizer/add_2*
T0
G
optimizer/concat_3/concat_dimConst*
value	B :*
dtype0
8
optimizer/concat_3Identityoptimizer/Log_1*
T0
T
optimizer/strided_slice_2/stackConst*
valueB"        *
dtype0
V
!optimizer/strided_slice_2/stack_1Const*
valueB"       *
dtype0
V
!optimizer/strided_slice_2/stack_2Const*
valueB"      *
dtype0

optimizer/strided_slice_2StridedSliceStopGradientoptimizer/strided_slice_2/stack!optimizer/strided_slice_2/stack_1!optimizer/strided_slice_2/stack_2*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
T
optimizer/strided_slice_3/stackConst*
dtype0*
valueB"        
V
!optimizer/strided_slice_3/stack_1Const*
valueB"       *
dtype0
V
!optimizer/strided_slice_3/stack_2Const*
valueB"      *
dtype0

optimizer/strided_slice_3StridedSliceoptimizer/concat_3optimizer/strided_slice_3/stack!optimizer/strided_slice_3/stack_1!optimizer/strided_slice_3/stack_2*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*
T0*
Index0*
shrink_axis_mask 
Z
0optimizer/softmax_cross_entropy_with_logits/RankConst*
value	B :*
dtype0
n
1optimizer/softmax_cross_entropy_with_logits/ShapeShapeoptimizer/strided_slice_3*
T0*
out_type0
\
2optimizer/softmax_cross_entropy_with_logits/Rank_1Const*
value	B :*
dtype0
p
3optimizer/softmax_cross_entropy_with_logits/Shape_1Shapeoptimizer/strided_slice_3*
T0*
out_type0
[
1optimizer/softmax_cross_entropy_with_logits/Sub/yConst*
value	B :*
dtype0
¦
/optimizer/softmax_cross_entropy_with_logits/SubSub2optimizer/softmax_cross_entropy_with_logits/Rank_11optimizer/softmax_cross_entropy_with_logits/Sub/y*
T0

7optimizer/softmax_cross_entropy_with_logits/Slice/beginPack/optimizer/softmax_cross_entropy_with_logits/Sub*
T0*

axis *
N
d
6optimizer/softmax_cross_entropy_with_logits/Slice/sizeConst*
valueB:*
dtype0
ö
1optimizer/softmax_cross_entropy_with_logits/SliceSlice3optimizer/softmax_cross_entropy_with_logits/Shape_17optimizer/softmax_cross_entropy_with_logits/Slice/begin6optimizer/softmax_cross_entropy_with_logits/Slice/size*
T0*
Index0
r
;optimizer/softmax_cross_entropy_with_logits/concat/values_0Const*
valueB:
’’’’’’’’’*
dtype0
a
7optimizer/softmax_cross_entropy_with_logits/concat/axisConst*
value	B : *
dtype0

2optimizer/softmax_cross_entropy_with_logits/concatConcatV2;optimizer/softmax_cross_entropy_with_logits/concat/values_01optimizer/softmax_cross_entropy_with_logits/Slice7optimizer/softmax_cross_entropy_with_logits/concat/axis*

Tidx0*
T0*
N
¤
3optimizer/softmax_cross_entropy_with_logits/ReshapeReshapeoptimizer/strided_slice_32optimizer/softmax_cross_entropy_with_logits/concat*
T0*
Tshape0
\
2optimizer/softmax_cross_entropy_with_logits/Rank_2Const*
dtype0*
value	B :
p
3optimizer/softmax_cross_entropy_with_logits/Shape_2Shapeoptimizer/strided_slice_2*
T0*
out_type0
]
3optimizer/softmax_cross_entropy_with_logits/Sub_1/yConst*
value	B :*
dtype0
Ŗ
1optimizer/softmax_cross_entropy_with_logits/Sub_1Sub2optimizer/softmax_cross_entropy_with_logits/Rank_23optimizer/softmax_cross_entropy_with_logits/Sub_1/y*
T0

9optimizer/softmax_cross_entropy_with_logits/Slice_1/beginPack1optimizer/softmax_cross_entropy_with_logits/Sub_1*
T0*

axis *
N
f
8optimizer/softmax_cross_entropy_with_logits/Slice_1/sizeConst*
valueB:*
dtype0
ü
3optimizer/softmax_cross_entropy_with_logits/Slice_1Slice3optimizer/softmax_cross_entropy_with_logits/Shape_29optimizer/softmax_cross_entropy_with_logits/Slice_1/begin8optimizer/softmax_cross_entropy_with_logits/Slice_1/size*
T0*
Index0
t
=optimizer/softmax_cross_entropy_with_logits/concat_1/values_0Const*
valueB:
’’’’’’’’’*
dtype0
c
9optimizer/softmax_cross_entropy_with_logits/concat_1/axisConst*
value	B : *
dtype0

4optimizer/softmax_cross_entropy_with_logits/concat_1ConcatV2=optimizer/softmax_cross_entropy_with_logits/concat_1/values_03optimizer/softmax_cross_entropy_with_logits/Slice_19optimizer/softmax_cross_entropy_with_logits/concat_1/axis*
N*

Tidx0*
T0
Ø
5optimizer/softmax_cross_entropy_with_logits/Reshape_1Reshapeoptimizer/strided_slice_24optimizer/softmax_cross_entropy_with_logits/concat_1*
Tshape0*
T0
Į
+optimizer/softmax_cross_entropy_with_logitsSoftmaxCrossEntropyWithLogits3optimizer/softmax_cross_entropy_with_logits/Reshape5optimizer/softmax_cross_entropy_with_logits/Reshape_1*
T0
]
3optimizer/softmax_cross_entropy_with_logits/Sub_2/yConst*
value	B :*
dtype0
Ø
1optimizer/softmax_cross_entropy_with_logits/Sub_2Sub0optimizer/softmax_cross_entropy_with_logits/Rank3optimizer/softmax_cross_entropy_with_logits/Sub_2/y*
T0
g
9optimizer/softmax_cross_entropy_with_logits/Slice_2/beginConst*
valueB: *
dtype0

8optimizer/softmax_cross_entropy_with_logits/Slice_2/sizePack1optimizer/softmax_cross_entropy_with_logits/Sub_2*
T0*

axis *
N
ś
3optimizer/softmax_cross_entropy_with_logits/Slice_2Slice1optimizer/softmax_cross_entropy_with_logits/Shape9optimizer/softmax_cross_entropy_with_logits/Slice_2/begin8optimizer/softmax_cross_entropy_with_logits/Slice_2/size*
T0*
Index0
¹
5optimizer/softmax_cross_entropy_with_logits/Reshape_2Reshape+optimizer/softmax_cross_entropy_with_logits3optimizer/softmax_cross_entropy_with_logits/Slice_2*
T0*
Tshape0
T
optimizer/NegNeg5optimizer/softmax_cross_entropy_with_logits/Reshape_2*
T0
D
optimizer/stackPackoptimizer/Neg*
T0*

axis*
N
K
!optimizer/Sum_1/reduction_indicesConst*
dtype0*
value	B :
p
optimizer/Sum_1Sumoptimizer/stack!optimizer/Sum_1/reduction_indices*

Tidx0*
	keep_dims(*
T0
\
/optimizer/PolynomialDecay/initial_learning_rateConst*
valueB
 *RI9*
dtype0
M
 optimizer/PolynomialDecay/Cast/xConst*
valueB
 *’ęŪ.*
dtype0
O
"optimizer/PolynomialDecay/Cast_1/xConst*
valueB
 *  ?*
dtype0
b
 optimizer/PolynomialDecay/Cast_2Castglobal_step/read*

SrcT0*
Truncate( *

DstT0
O
"optimizer/PolynomialDecay/Cast_3/xConst*
dtype0*
valueB
 :Ą±
t
 optimizer/PolynomialDecay/Cast_3Cast"optimizer/PolynomialDecay/Cast_3/x*

SrcT0*
Truncate( *

DstT0
P
#optimizer/PolynomialDecay/Minimum/yConst*
valueB
 *J*
dtype0
|
!optimizer/PolynomialDecay/MinimumMinimum optimizer/PolynomialDecay/Cast_2#optimizer/PolynomialDecay/Minimum/y*
T0
v
optimizer/PolynomialDecay/divRealDiv!optimizer/PolynomialDecay/Minimum optimizer/PolynomialDecay/Cast_3*
T0

optimizer/PolynomialDecay/subSub/optimizer/PolynomialDecay/initial_learning_rate optimizer/PolynomialDecay/Cast/x*
T0
N
!optimizer/PolynomialDecay/sub_1/xConst*
valueB
 *  ?*
dtype0
q
optimizer/PolynomialDecay/sub_1Sub!optimizer/PolynomialDecay/sub_1/xoptimizer/PolynomialDecay/div*
T0
r
optimizer/PolynomialDecay/PowPowoptimizer/PolynomialDecay/sub_1"optimizer/PolynomialDecay/Cast_1/x*
T0
k
optimizer/PolynomialDecay/MulMuloptimizer/PolynomialDecay/suboptimizer/PolynomialDecay/Pow*
T0
j
optimizer/PolynomialDecayAddoptimizer/PolynomialDecay/Mul optimizer/PolynomialDecay/Cast/x*
T0
Q
optimizer/extrinsic_returnsPlaceholder*
dtype0*
shape:’’’’’’’’’
X
"optimizer/extrinsic_value_estimatePlaceholder*
dtype0*
shape:’’’’’’’’’
J
optimizer/advantagesPlaceholder*
shape:’’’’’’’’’*
dtype0
K
optimizer/ExpandDims/dimConst*
valueB :
’’’’’’’’’*
dtype0
g
optimizer/ExpandDims
ExpandDimsoptimizer/advantagesoptimizer/ExpandDims/dim*
T0*

Tdim0
^
1optimizer/PolynomialDecay_1/initial_learning_rateConst*
dtype0*
valueB
 *ĶĢL>
O
"optimizer/PolynomialDecay_1/Cast/xConst*
valueB
 *ĶĢĢ=*
dtype0
Q
$optimizer/PolynomialDecay_1/Cast_1/xConst*
valueB
 *  ?*
dtype0
d
"optimizer/PolynomialDecay_1/Cast_2Castglobal_step/read*

SrcT0*
Truncate( *

DstT0
Q
$optimizer/PolynomialDecay_1/Cast_3/xConst*
valueB
 *J*
dtype0
R
%optimizer/PolynomialDecay_1/Minimum/yConst*
valueB
 *J*
dtype0

#optimizer/PolynomialDecay_1/MinimumMinimum"optimizer/PolynomialDecay_1/Cast_2%optimizer/PolynomialDecay_1/Minimum/y*
T0
~
optimizer/PolynomialDecay_1/divRealDiv#optimizer/PolynomialDecay_1/Minimum$optimizer/PolynomialDecay_1/Cast_3/x*
T0

optimizer/PolynomialDecay_1/subSub1optimizer/PolynomialDecay_1/initial_learning_rate"optimizer/PolynomialDecay_1/Cast/x*
T0
P
#optimizer/PolynomialDecay_1/sub_1/xConst*
dtype0*
valueB
 *  ?
w
!optimizer/PolynomialDecay_1/sub_1Sub#optimizer/PolynomialDecay_1/sub_1/xoptimizer/PolynomialDecay_1/div*
T0
x
optimizer/PolynomialDecay_1/PowPow!optimizer/PolynomialDecay_1/sub_1$optimizer/PolynomialDecay_1/Cast_1/x*
T0
q
optimizer/PolynomialDecay_1/MulMuloptimizer/PolynomialDecay_1/suboptimizer/PolynomialDecay_1/Pow*
T0
p
optimizer/PolynomialDecay_1Addoptimizer/PolynomialDecay_1/Mul"optimizer/PolynomialDecay_1/Cast/x*
T0
^
1optimizer/PolynomialDecay_2/initial_learning_rateConst*
valueB
 *
×£;*
dtype0
O
"optimizer/PolynomialDecay_2/Cast/xConst*
dtype0*
valueB
 *¬Å'7
Q
$optimizer/PolynomialDecay_2/Cast_1/xConst*
valueB
 *  ?*
dtype0
d
"optimizer/PolynomialDecay_2/Cast_2Castglobal_step/read*

SrcT0*
Truncate( *

DstT0
Q
$optimizer/PolynomialDecay_2/Cast_3/xConst*
valueB
 *J*
dtype0
R
%optimizer/PolynomialDecay_2/Minimum/yConst*
valueB
 *J*
dtype0

#optimizer/PolynomialDecay_2/MinimumMinimum"optimizer/PolynomialDecay_2/Cast_2%optimizer/PolynomialDecay_2/Minimum/y*
T0
~
optimizer/PolynomialDecay_2/divRealDiv#optimizer/PolynomialDecay_2/Minimum$optimizer/PolynomialDecay_2/Cast_3/x*
T0

optimizer/PolynomialDecay_2/subSub1optimizer/PolynomialDecay_2/initial_learning_rate"optimizer/PolynomialDecay_2/Cast/x*
T0
P
#optimizer/PolynomialDecay_2/sub_1/xConst*
valueB
 *  ?*
dtype0
w
!optimizer/PolynomialDecay_2/sub_1Sub#optimizer/PolynomialDecay_2/sub_1/xoptimizer/PolynomialDecay_2/div*
T0
x
optimizer/PolynomialDecay_2/PowPow!optimizer/PolynomialDecay_2/sub_1$optimizer/PolynomialDecay_2/Cast_1/x*
T0
q
optimizer/PolynomialDecay_2/MulMuloptimizer/PolynomialDecay_2/suboptimizer/PolynomialDecay_2/Pow*
T0
p
optimizer/PolynomialDecay_2Addoptimizer/PolynomialDecay_2/Mul"optimizer/PolynomialDecay_2/Cast/x*
T0
K
!optimizer/Sum_2/reduction_indicesConst*
value	B :*
dtype0

optimizer/Sum_2Sum!optimizer/extrinsic_value/BiasAdd!optimizer/Sum_2/reduction_indices*

Tidx0*
	keep_dims( *
T0
R
optimizer/subSuboptimizer/Sum_2"optimizer/extrinsic_value_estimate*
T0
<
optimizer/Neg_1Negoptimizer/PolynomialDecay_1*
T0
_
optimizer/clip_by_value/MinimumMinimumoptimizer/suboptimizer/PolynomialDecay_1*
T0
]
optimizer/clip_by_valueMaximumoptimizer/clip_by_value/Minimumoptimizer/Neg_1*
T0
\
optimizer/add_3Add"optimizer/extrinsic_value_estimateoptimizer/clip_by_value*
T0
K
!optimizer/Sum_3/reduction_indicesConst*
value	B :*
dtype0

optimizer/Sum_3Sum!optimizer/extrinsic_value/BiasAdd!optimizer/Sum_3/reduction_indices*

Tidx0*
	keep_dims( *
T0
g
optimizer/SquaredDifferenceSquaredDifferenceoptimizer/extrinsic_returnsoptimizer/Sum_3*
T0
i
optimizer/SquaredDifference_1SquaredDifferenceoptimizer/extrinsic_returnsoptimizer/add_3*
T0
a
optimizer/MaximumMaximumoptimizer/SquaredDifferenceoptimizer/SquaredDifference_1*
T0
h
optimizer/DynamicPartitionDynamicPartitionoptimizer/MaximumCast_2*
num_partitions*
T0
=
optimizer/ConstConst*
valueB: *
dtype0
m
optimizer/Mean_1Meanoptimizer/DynamicPartition:1optimizer/Const*

Tidx0*
	keep_dims( *
T0
M
optimizer/Rank/packedPackoptimizer/Mean_1*
T0*

axis *
N
8
optimizer/RankConst*
value	B :*
dtype0
?
optimizer/range/startConst*
value	B : *
dtype0
?
optimizer/range/deltaConst*
value	B :*
dtype0
b
optimizer/rangeRangeoptimizer/range/startoptimizer/Rankoptimizer/range/delta*

Tidx0
N
optimizer/Mean_2/inputPackoptimizer/Mean_1*
T0*

axis *
N
g
optimizer/Mean_2Meanoptimizer/Mean_2/inputoptimizer/range*

Tidx0*
	keep_dims( *
T0
@
optimizer/sub_1Subpolicy_1/Sum_2optimizer/Sum_1*
T0
.
optimizer/ExpExpoptimizer/sub_1*
T0
D
optimizer/mul_1Muloptimizer/Expoptimizer/ExpandDims*
T0
>
optimizer/sub_2/xConst*
valueB
 *  ?*
dtype0
O
optimizer/sub_2Suboptimizer/sub_2/xoptimizer/PolynomialDecay_1*
T0
>
optimizer/add_4/xConst*
valueB
 *  ?*
dtype0
O
optimizer/add_4Addoptimizer/add_4/xoptimizer/PolynomialDecay_1*
T0
U
!optimizer/clip_by_value_1/MinimumMinimumoptimizer/Expoptimizer/add_4*
T0
a
optimizer/clip_by_value_1Maximum!optimizer/clip_by_value_1/Minimumoptimizer/sub_2*
T0
P
optimizer/mul_2Muloptimizer/clip_by_value_1optimizer/ExpandDims*
T0
G
optimizer/MinimumMinimumoptimizer/mul_1optimizer/mul_2*
T0
j
optimizer/DynamicPartition_1DynamicPartitionoptimizer/MinimumCast_2*
num_partitions*
T0
F
optimizer/Const_1Const*
valueB"       *
dtype0
q
optimizer/Mean_3Meanoptimizer/DynamicPartition_1:1optimizer/Const_1*
T0*

Tidx0*
	keep_dims( 
1
optimizer/Neg_2Negoptimizer/Mean_3*
T0
.
optimizer/AbsAbsoptimizer/Neg_2*
T0
>
optimizer/mul_3/xConst*
valueB
 *   ?*
dtype0
D
optimizer/mul_3Muloptimizer/mul_3/xoptimizer/Mean_2*
T0
A
optimizer/add_5Addoptimizer/Neg_2optimizer/mul_3*
T0
g
optimizer/DynamicPartition_2DynamicPartitionpolicy_1/Sum_1Cast_2*
T0*
num_partitions
?
optimizer/Const_2Const*
valueB: *
dtype0
q
optimizer/Mean_4Meanoptimizer/DynamicPartition_2:1optimizer/Const_2*

Tidx0*
	keep_dims( *
T0
N
optimizer/mul_4Muloptimizer/PolynomialDecay_2optimizer/Mean_4*
T0
A
optimizer/sub_3Suboptimizer/add_5optimizer/mul_4*
T0
B
optimizer/gradients/ShapeConst*
dtype0*
valueB 
J
optimizer/gradients/grad_ys_0Const*
valueB
 *  ?*
dtype0
u
optimizer/gradients/FillFilloptimizer/gradients/Shapeoptimizer/gradients/grad_ys_0*
T0*

index_type0
V
,optimizer/gradients/optimizer/sub_3_grad/NegNegoptimizer/gradients/Fill*
T0

9optimizer/gradients/optimizer/sub_3_grad/tuple/group_depsNoOp^optimizer/gradients/Fill-^optimizer/gradients/optimizer/sub_3_grad/Neg
Ł
Aoptimizer/gradients/optimizer/sub_3_grad/tuple/control_dependencyIdentityoptimizer/gradients/Fill:^optimizer/gradients/optimizer/sub_3_grad/tuple/group_deps*
T0*+
_class!
loc:@optimizer/gradients/Fill

Coptimizer/gradients/optimizer/sub_3_grad/tuple/control_dependency_1Identity,optimizer/gradients/optimizer/sub_3_grad/Neg:^optimizer/gradients/optimizer/sub_3_grad/tuple/group_deps*
T0*?
_class5
31loc:@optimizer/gradients/optimizer/sub_3_grad/Neg

9optimizer/gradients/optimizer/add_5_grad/tuple/group_depsNoOpB^optimizer/gradients/optimizer/sub_3_grad/tuple/control_dependency

Aoptimizer/gradients/optimizer/add_5_grad/tuple/control_dependencyIdentityAoptimizer/gradients/optimizer/sub_3_grad/tuple/control_dependency:^optimizer/gradients/optimizer/add_5_grad/tuple/group_deps*
T0*+
_class!
loc:@optimizer/gradients/Fill

Coptimizer/gradients/optimizer/add_5_grad/tuple/control_dependency_1IdentityAoptimizer/gradients/optimizer/sub_3_grad/tuple/control_dependency:^optimizer/gradients/optimizer/add_5_grad/tuple/group_deps*
T0*+
_class!
loc:@optimizer/gradients/Fill

,optimizer/gradients/optimizer/mul_4_grad/MulMulCoptimizer/gradients/optimizer/sub_3_grad/tuple/control_dependency_1optimizer/Mean_4*
T0
 
.optimizer/gradients/optimizer/mul_4_grad/Mul_1MulCoptimizer/gradients/optimizer/sub_3_grad/tuple/control_dependency_1optimizer/PolynomialDecay_2*
T0
”
9optimizer/gradients/optimizer/mul_4_grad/tuple/group_depsNoOp-^optimizer/gradients/optimizer/mul_4_grad/Mul/^optimizer/gradients/optimizer/mul_4_grad/Mul_1

Aoptimizer/gradients/optimizer/mul_4_grad/tuple/control_dependencyIdentity,optimizer/gradients/optimizer/mul_4_grad/Mul:^optimizer/gradients/optimizer/mul_4_grad/tuple/group_deps*
T0*?
_class5
31loc:@optimizer/gradients/optimizer/mul_4_grad/Mul

Coptimizer/gradients/optimizer/mul_4_grad/tuple/control_dependency_1Identity.optimizer/gradients/optimizer/mul_4_grad/Mul_1:^optimizer/gradients/optimizer/mul_4_grad/tuple/group_deps*
T0*A
_class7
53loc:@optimizer/gradients/optimizer/mul_4_grad/Mul_1

,optimizer/gradients/optimizer/Neg_2_grad/NegNegAoptimizer/gradients/optimizer/add_5_grad/tuple/control_dependency*
T0

,optimizer/gradients/optimizer/mul_3_grad/MulMulCoptimizer/gradients/optimizer/add_5_grad/tuple/control_dependency_1optimizer/Mean_2*
T0

.optimizer/gradients/optimizer/mul_3_grad/Mul_1MulCoptimizer/gradients/optimizer/add_5_grad/tuple/control_dependency_1optimizer/mul_3/x*
T0
”
9optimizer/gradients/optimizer/mul_3_grad/tuple/group_depsNoOp-^optimizer/gradients/optimizer/mul_3_grad/Mul/^optimizer/gradients/optimizer/mul_3_grad/Mul_1

Aoptimizer/gradients/optimizer/mul_3_grad/tuple/control_dependencyIdentity,optimizer/gradients/optimizer/mul_3_grad/Mul:^optimizer/gradients/optimizer/mul_3_grad/tuple/group_deps*
T0*?
_class5
31loc:@optimizer/gradients/optimizer/mul_3_grad/Mul

Coptimizer/gradients/optimizer/mul_3_grad/tuple/control_dependency_1Identity.optimizer/gradients/optimizer/mul_3_grad/Mul_1:^optimizer/gradients/optimizer/mul_3_grad/tuple/group_deps*
T0*A
_class7
53loc:@optimizer/gradients/optimizer/mul_3_grad/Mul_1
e
7optimizer/gradients/optimizer/Mean_4_grad/Reshape/shapeConst*
dtype0*
valueB:
Ń
1optimizer/gradients/optimizer/Mean_4_grad/ReshapeReshapeCoptimizer/gradients/optimizer/mul_4_grad/tuple/control_dependency_17optimizer/gradients/optimizer/Mean_4_grad/Reshape/shape*
Tshape0*
T0
q
/optimizer/gradients/optimizer/Mean_4_grad/ShapeShapeoptimizer/DynamicPartition_2:1*
T0*
out_type0
µ
.optimizer/gradients/optimizer/Mean_4_grad/TileTile1optimizer/gradients/optimizer/Mean_4_grad/Reshape/optimizer/gradients/optimizer/Mean_4_grad/Shape*

Tmultiples0*
T0
s
1optimizer/gradients/optimizer/Mean_4_grad/Shape_1Shapeoptimizer/DynamicPartition_2:1*
T0*
out_type0
Z
1optimizer/gradients/optimizer/Mean_4_grad/Shape_2Const*
valueB *
dtype0
]
/optimizer/gradients/optimizer/Mean_4_grad/ConstConst*
valueB: *
dtype0
Ą
.optimizer/gradients/optimizer/Mean_4_grad/ProdProd1optimizer/gradients/optimizer/Mean_4_grad/Shape_1/optimizer/gradients/optimizer/Mean_4_grad/Const*

Tidx0*
	keep_dims( *
T0
_
1optimizer/gradients/optimizer/Mean_4_grad/Const_1Const*
valueB: *
dtype0
Ä
0optimizer/gradients/optimizer/Mean_4_grad/Prod_1Prod1optimizer/gradients/optimizer/Mean_4_grad/Shape_21optimizer/gradients/optimizer/Mean_4_grad/Const_1*

Tidx0*
	keep_dims( *
T0
]
3optimizer/gradients/optimizer/Mean_4_grad/Maximum/yConst*
value	B :*
dtype0
¬
1optimizer/gradients/optimizer/Mean_4_grad/MaximumMaximum0optimizer/gradients/optimizer/Mean_4_grad/Prod_13optimizer/gradients/optimizer/Mean_4_grad/Maximum/y*
T0
Ŗ
2optimizer/gradients/optimizer/Mean_4_grad/floordivFloorDiv.optimizer/gradients/optimizer/Mean_4_grad/Prod1optimizer/gradients/optimizer/Mean_4_grad/Maximum*
T0

.optimizer/gradients/optimizer/Mean_4_grad/CastCast2optimizer/gradients/optimizer/Mean_4_grad/floordiv*
Truncate( *

DstT0*

SrcT0
„
1optimizer/gradients/optimizer/Mean_4_grad/truedivRealDiv.optimizer/gradients/optimizer/Mean_4_grad/Tile.optimizer/gradients/optimizer/Mean_4_grad/Cast*
T0
l
7optimizer/gradients/optimizer/Mean_3_grad/Reshape/shapeConst*
valueB"      *
dtype0
ŗ
1optimizer/gradients/optimizer/Mean_3_grad/ReshapeReshape,optimizer/gradients/optimizer/Neg_2_grad/Neg7optimizer/gradients/optimizer/Mean_3_grad/Reshape/shape*
T0*
Tshape0
q
/optimizer/gradients/optimizer/Mean_3_grad/ShapeShapeoptimizer/DynamicPartition_1:1*
T0*
out_type0
µ
.optimizer/gradients/optimizer/Mean_3_grad/TileTile1optimizer/gradients/optimizer/Mean_3_grad/Reshape/optimizer/gradients/optimizer/Mean_3_grad/Shape*

Tmultiples0*
T0
s
1optimizer/gradients/optimizer/Mean_3_grad/Shape_1Shapeoptimizer/DynamicPartition_1:1*
T0*
out_type0
Z
1optimizer/gradients/optimizer/Mean_3_grad/Shape_2Const*
valueB *
dtype0
]
/optimizer/gradients/optimizer/Mean_3_grad/ConstConst*
valueB: *
dtype0
Ą
.optimizer/gradients/optimizer/Mean_3_grad/ProdProd1optimizer/gradients/optimizer/Mean_3_grad/Shape_1/optimizer/gradients/optimizer/Mean_3_grad/Const*

Tidx0*
	keep_dims( *
T0
_
1optimizer/gradients/optimizer/Mean_3_grad/Const_1Const*
valueB: *
dtype0
Ä
0optimizer/gradients/optimizer/Mean_3_grad/Prod_1Prod1optimizer/gradients/optimizer/Mean_3_grad/Shape_21optimizer/gradients/optimizer/Mean_3_grad/Const_1*

Tidx0*
	keep_dims( *
T0
]
3optimizer/gradients/optimizer/Mean_3_grad/Maximum/yConst*
value	B :*
dtype0
¬
1optimizer/gradients/optimizer/Mean_3_grad/MaximumMaximum0optimizer/gradients/optimizer/Mean_3_grad/Prod_13optimizer/gradients/optimizer/Mean_3_grad/Maximum/y*
T0
Ŗ
2optimizer/gradients/optimizer/Mean_3_grad/floordivFloorDiv.optimizer/gradients/optimizer/Mean_3_grad/Prod1optimizer/gradients/optimizer/Mean_3_grad/Maximum*
T0

.optimizer/gradients/optimizer/Mean_3_grad/CastCast2optimizer/gradients/optimizer/Mean_3_grad/floordiv*
Truncate( *

DstT0*

SrcT0
„
1optimizer/gradients/optimizer/Mean_3_grad/truedivRealDiv.optimizer/gradients/optimizer/Mean_3_grad/Tile.optimizer/gradients/optimizer/Mean_3_grad/Cast*
T0
e
7optimizer/gradients/optimizer/Mean_2_grad/Reshape/shapeConst*
valueB:*
dtype0
Ń
1optimizer/gradients/optimizer/Mean_2_grad/ReshapeReshapeCoptimizer/gradients/optimizer/mul_3_grad/tuple/control_dependency_17optimizer/gradients/optimizer/Mean_2_grad/Reshape/shape*
T0*
Tshape0
]
/optimizer/gradients/optimizer/Mean_2_grad/ConstConst*
valueB:*
dtype0
µ
.optimizer/gradients/optimizer/Mean_2_grad/TileTile1optimizer/gradients/optimizer/Mean_2_grad/Reshape/optimizer/gradients/optimizer/Mean_2_grad/Const*

Tmultiples0*
T0
^
1optimizer/gradients/optimizer/Mean_2_grad/Const_1Const*
valueB
 *  ?*
dtype0
Ø
1optimizer/gradients/optimizer/Mean_2_grad/truedivRealDiv.optimizer/gradients/optimizer/Mean_2_grad/Tile1optimizer/gradients/optimizer/Mean_2_grad/Const_1*
T0
R
optimizer/gradients/zeros_like	ZerosLikeoptimizer/DynamicPartition_2*
T0
e
;optimizer/gradients/optimizer/DynamicPartition_2_grad/ShapeShapeCast_2*
T0*
out_type0
i
;optimizer/gradients/optimizer/DynamicPartition_2_grad/ConstConst*
valueB: *
dtype0
ā
:optimizer/gradients/optimizer/DynamicPartition_2_grad/ProdProd;optimizer/gradients/optimizer/DynamicPartition_2_grad/Shape;optimizer/gradients/optimizer/DynamicPartition_2_grad/Const*

Tidx0*
	keep_dims( *
T0
k
Aoptimizer/gradients/optimizer/DynamicPartition_2_grad/range/startConst*
value	B : *
dtype0
k
Aoptimizer/gradients/optimizer/DynamicPartition_2_grad/range/deltaConst*
value	B :*
dtype0

;optimizer/gradients/optimizer/DynamicPartition_2_grad/rangeRangeAoptimizer/gradients/optimizer/DynamicPartition_2_grad/range/start:optimizer/gradients/optimizer/DynamicPartition_2_grad/ProdAoptimizer/gradients/optimizer/DynamicPartition_2_grad/range/delta*

Tidx0
Ł
=optimizer/gradients/optimizer/DynamicPartition_2_grad/ReshapeReshape;optimizer/gradients/optimizer/DynamicPartition_2_grad/range;optimizer/gradients/optimizer/DynamicPartition_2_grad/Shape*
T0*
Tshape0
Ą
Foptimizer/gradients/optimizer/DynamicPartition_2_grad/DynamicPartitionDynamicPartition=optimizer/gradients/optimizer/DynamicPartition_2_grad/ReshapeCast_2*
num_partitions*
T0
Ė
Coptimizer/gradients/optimizer/DynamicPartition_2_grad/DynamicStitchDynamicStitchFoptimizer/gradients/optimizer/DynamicPartition_2_grad/DynamicPartitionHoptimizer/gradients/optimizer/DynamicPartition_2_grad/DynamicPartition:1optimizer/gradients/zeros_like1optimizer/gradients/optimizer/Mean_4_grad/truediv*
T0*
N
o
=optimizer/gradients/optimizer/DynamicPartition_2_grad/Shape_1Shapepolicy_1/Sum_1*
T0*
out_type0
å
?optimizer/gradients/optimizer/DynamicPartition_2_grad/Reshape_1ReshapeCoptimizer/gradients/optimizer/DynamicPartition_2_grad/DynamicStitch=optimizer/gradients/optimizer/DynamicPartition_2_grad/Shape_1*
Tshape0*
T0
T
 optimizer/gradients/zeros_like_1	ZerosLikeoptimizer/DynamicPartition_1*
T0
e
;optimizer/gradients/optimizer/DynamicPartition_1_grad/ShapeShapeCast_2*
T0*
out_type0
i
;optimizer/gradients/optimizer/DynamicPartition_1_grad/ConstConst*
dtype0*
valueB: 
ā
:optimizer/gradients/optimizer/DynamicPartition_1_grad/ProdProd;optimizer/gradients/optimizer/DynamicPartition_1_grad/Shape;optimizer/gradients/optimizer/DynamicPartition_1_grad/Const*
T0*

Tidx0*
	keep_dims( 
k
Aoptimizer/gradients/optimizer/DynamicPartition_1_grad/range/startConst*
value	B : *
dtype0
k
Aoptimizer/gradients/optimizer/DynamicPartition_1_grad/range/deltaConst*
value	B :*
dtype0

;optimizer/gradients/optimizer/DynamicPartition_1_grad/rangeRangeAoptimizer/gradients/optimizer/DynamicPartition_1_grad/range/start:optimizer/gradients/optimizer/DynamicPartition_1_grad/ProdAoptimizer/gradients/optimizer/DynamicPartition_1_grad/range/delta*

Tidx0
Ł
=optimizer/gradients/optimizer/DynamicPartition_1_grad/ReshapeReshape;optimizer/gradients/optimizer/DynamicPartition_1_grad/range;optimizer/gradients/optimizer/DynamicPartition_1_grad/Shape*
Tshape0*
T0
Ą
Foptimizer/gradients/optimizer/DynamicPartition_1_grad/DynamicPartitionDynamicPartition=optimizer/gradients/optimizer/DynamicPartition_1_grad/ReshapeCast_2*
num_partitions*
T0
Ķ
Coptimizer/gradients/optimizer/DynamicPartition_1_grad/DynamicStitchDynamicStitchFoptimizer/gradients/optimizer/DynamicPartition_1_grad/DynamicPartitionHoptimizer/gradients/optimizer/DynamicPartition_1_grad/DynamicPartition:1 optimizer/gradients/zeros_like_11optimizer/gradients/optimizer/Mean_3_grad/truediv*
T0*
N
r
=optimizer/gradients/optimizer/DynamicPartition_1_grad/Shape_1Shapeoptimizer/Minimum*
T0*
out_type0
å
?optimizer/gradients/optimizer/DynamicPartition_1_grad/Reshape_1ReshapeCoptimizer/gradients/optimizer/DynamicPartition_1_grad/DynamicStitch=optimizer/gradients/optimizer/DynamicPartition_1_grad/Shape_1*
T0*
Tshape0

7optimizer/gradients/optimizer/Mean_2/input_grad/unstackUnpack1optimizer/gradients/optimizer/Mean_2_grad/truediv*
T0*	
num*

axis 
_
-optimizer/gradients/policy_1/Sum_1_grad/ShapeShapepolicy_1/stack*
T0*
out_type0

,optimizer/gradients/policy_1/Sum_1_grad/SizeConst*@
_class6
42loc:@optimizer/gradients/policy_1/Sum_1_grad/Shape*
value	B :*
dtype0
Ķ
+optimizer/gradients/policy_1/Sum_1_grad/addAdd policy_1/Sum_1/reduction_indices,optimizer/gradients/policy_1/Sum_1_grad/Size*
T0*@
_class6
42loc:@optimizer/gradients/policy_1/Sum_1_grad/Shape
Ż
+optimizer/gradients/policy_1/Sum_1_grad/modFloorMod+optimizer/gradients/policy_1/Sum_1_grad/add,optimizer/gradients/policy_1/Sum_1_grad/Size*
T0*@
_class6
42loc:@optimizer/gradients/policy_1/Sum_1_grad/Shape

/optimizer/gradients/policy_1/Sum_1_grad/Shape_1Const*
dtype0*@
_class6
42loc:@optimizer/gradients/policy_1/Sum_1_grad/Shape*
valueB 

3optimizer/gradients/policy_1/Sum_1_grad/range/startConst*@
_class6
42loc:@optimizer/gradients/policy_1/Sum_1_grad/Shape*
value	B : *
dtype0

3optimizer/gradients/policy_1/Sum_1_grad/range/deltaConst*@
_class6
42loc:@optimizer/gradients/policy_1/Sum_1_grad/Shape*
value	B :*
dtype0

-optimizer/gradients/policy_1/Sum_1_grad/rangeRange3optimizer/gradients/policy_1/Sum_1_grad/range/start,optimizer/gradients/policy_1/Sum_1_grad/Size3optimizer/gradients/policy_1/Sum_1_grad/range/delta*@
_class6
42loc:@optimizer/gradients/policy_1/Sum_1_grad/Shape*

Tidx0

2optimizer/gradients/policy_1/Sum_1_grad/Fill/valueConst*@
_class6
42loc:@optimizer/gradients/policy_1/Sum_1_grad/Shape*
value	B :*
dtype0
ö
,optimizer/gradients/policy_1/Sum_1_grad/FillFill/optimizer/gradients/policy_1/Sum_1_grad/Shape_12optimizer/gradients/policy_1/Sum_1_grad/Fill/value*@
_class6
42loc:@optimizer/gradients/policy_1/Sum_1_grad/Shape*

index_type0*
T0
Ó
5optimizer/gradients/policy_1/Sum_1_grad/DynamicStitchDynamicStitch-optimizer/gradients/policy_1/Sum_1_grad/range+optimizer/gradients/policy_1/Sum_1_grad/mod-optimizer/gradients/policy_1/Sum_1_grad/Shape,optimizer/gradients/policy_1/Sum_1_grad/Fill*@
_class6
42loc:@optimizer/gradients/policy_1/Sum_1_grad/Shape*
N*
T0

1optimizer/gradients/policy_1/Sum_1_grad/Maximum/yConst*@
_class6
42loc:@optimizer/gradients/policy_1/Sum_1_grad/Shape*
value	B :*
dtype0
ļ
/optimizer/gradients/policy_1/Sum_1_grad/MaximumMaximum5optimizer/gradients/policy_1/Sum_1_grad/DynamicStitch1optimizer/gradients/policy_1/Sum_1_grad/Maximum/y*
T0*@
_class6
42loc:@optimizer/gradients/policy_1/Sum_1_grad/Shape
ē
0optimizer/gradients/policy_1/Sum_1_grad/floordivFloorDiv-optimizer/gradients/policy_1/Sum_1_grad/Shape/optimizer/gradients/policy_1/Sum_1_grad/Maximum*
T0*@
_class6
42loc:@optimizer/gradients/policy_1/Sum_1_grad/Shape
É
/optimizer/gradients/policy_1/Sum_1_grad/ReshapeReshape?optimizer/gradients/optimizer/DynamicPartition_2_grad/Reshape_15optimizer/gradients/policy_1/Sum_1_grad/DynamicStitch*
T0*
Tshape0
²
,optimizer/gradients/policy_1/Sum_1_grad/TileTile/optimizer/gradients/policy_1/Sum_1_grad/Reshape0optimizer/gradients/policy_1/Sum_1_grad/floordiv*

Tmultiples0*
T0
c
0optimizer/gradients/optimizer/Minimum_grad/ShapeShapeoptimizer/mul_1*
T0*
out_type0
e
2optimizer/gradients/optimizer/Minimum_grad/Shape_1Shapeoptimizer/mul_2*
T0*
out_type0

2optimizer/gradients/optimizer/Minimum_grad/Shape_2Shape?optimizer/gradients/optimizer/DynamicPartition_1_grad/Reshape_1*
T0*
out_type0
c
6optimizer/gradients/optimizer/Minimum_grad/zeros/ConstConst*
valueB
 *    *
dtype0
æ
0optimizer/gradients/optimizer/Minimum_grad/zerosFill2optimizer/gradients/optimizer/Minimum_grad/Shape_26optimizer/gradients/optimizer/Minimum_grad/zeros/Const*

index_type0*
T0
l
4optimizer/gradients/optimizer/Minimum_grad/LessEqual	LessEqualoptimizer/mul_1optimizer/mul_2*
T0
Č
@optimizer/gradients/optimizer/Minimum_grad/BroadcastGradientArgsBroadcastGradientArgs0optimizer/gradients/optimizer/Minimum_grad/Shape2optimizer/gradients/optimizer/Minimum_grad/Shape_1*
T0
ķ
1optimizer/gradients/optimizer/Minimum_grad/SelectSelect4optimizer/gradients/optimizer/Minimum_grad/LessEqual?optimizer/gradients/optimizer/DynamicPartition_1_grad/Reshape_10optimizer/gradients/optimizer/Minimum_grad/zeros*
T0
Š
.optimizer/gradients/optimizer/Minimum_grad/SumSum1optimizer/gradients/optimizer/Minimum_grad/Select@optimizer/gradients/optimizer/Minimum_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
¶
2optimizer/gradients/optimizer/Minimum_grad/ReshapeReshape.optimizer/gradients/optimizer/Minimum_grad/Sum0optimizer/gradients/optimizer/Minimum_grad/Shape*
T0*
Tshape0
ļ
3optimizer/gradients/optimizer/Minimum_grad/Select_1Select4optimizer/gradients/optimizer/Minimum_grad/LessEqual0optimizer/gradients/optimizer/Minimum_grad/zeros?optimizer/gradients/optimizer/DynamicPartition_1_grad/Reshape_1*
T0
Ö
0optimizer/gradients/optimizer/Minimum_grad/Sum_1Sum3optimizer/gradients/optimizer/Minimum_grad/Select_1Boptimizer/gradients/optimizer/Minimum_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
¼
4optimizer/gradients/optimizer/Minimum_grad/Reshape_1Reshape0optimizer/gradients/optimizer/Minimum_grad/Sum_12optimizer/gradients/optimizer/Minimum_grad/Shape_1*
T0*
Tshape0
Æ
;optimizer/gradients/optimizer/Minimum_grad/tuple/group_depsNoOp3^optimizer/gradients/optimizer/Minimum_grad/Reshape5^optimizer/gradients/optimizer/Minimum_grad/Reshape_1

Coptimizer/gradients/optimizer/Minimum_grad/tuple/control_dependencyIdentity2optimizer/gradients/optimizer/Minimum_grad/Reshape<^optimizer/gradients/optimizer/Minimum_grad/tuple/group_deps*
T0*E
_class;
97loc:@optimizer/gradients/optimizer/Minimum_grad/Reshape

Eoptimizer/gradients/optimizer/Minimum_grad/tuple/control_dependency_1Identity4optimizer/gradients/optimizer/Minimum_grad/Reshape_1<^optimizer/gradients/optimizer/Minimum_grad/tuple/group_deps*
T0*G
_class=
;9loc:@optimizer/gradients/optimizer/Minimum_grad/Reshape_1
e
7optimizer/gradients/optimizer/Mean_1_grad/Reshape/shapeConst*
valueB:*
dtype0
Å
1optimizer/gradients/optimizer/Mean_1_grad/ReshapeReshape7optimizer/gradients/optimizer/Mean_2/input_grad/unstack7optimizer/gradients/optimizer/Mean_1_grad/Reshape/shape*
T0*
Tshape0
o
/optimizer/gradients/optimizer/Mean_1_grad/ShapeShapeoptimizer/DynamicPartition:1*
T0*
out_type0
µ
.optimizer/gradients/optimizer/Mean_1_grad/TileTile1optimizer/gradients/optimizer/Mean_1_grad/Reshape/optimizer/gradients/optimizer/Mean_1_grad/Shape*

Tmultiples0*
T0
q
1optimizer/gradients/optimizer/Mean_1_grad/Shape_1Shapeoptimizer/DynamicPartition:1*
T0*
out_type0
Z
1optimizer/gradients/optimizer/Mean_1_grad/Shape_2Const*
valueB *
dtype0
]
/optimizer/gradients/optimizer/Mean_1_grad/ConstConst*
valueB: *
dtype0
Ą
.optimizer/gradients/optimizer/Mean_1_grad/ProdProd1optimizer/gradients/optimizer/Mean_1_grad/Shape_1/optimizer/gradients/optimizer/Mean_1_grad/Const*

Tidx0*
	keep_dims( *
T0
_
1optimizer/gradients/optimizer/Mean_1_grad/Const_1Const*
dtype0*
valueB: 
Ä
0optimizer/gradients/optimizer/Mean_1_grad/Prod_1Prod1optimizer/gradients/optimizer/Mean_1_grad/Shape_21optimizer/gradients/optimizer/Mean_1_grad/Const_1*
T0*

Tidx0*
	keep_dims( 
]
3optimizer/gradients/optimizer/Mean_1_grad/Maximum/yConst*
value	B :*
dtype0
¬
1optimizer/gradients/optimizer/Mean_1_grad/MaximumMaximum0optimizer/gradients/optimizer/Mean_1_grad/Prod_13optimizer/gradients/optimizer/Mean_1_grad/Maximum/y*
T0
Ŗ
2optimizer/gradients/optimizer/Mean_1_grad/floordivFloorDiv.optimizer/gradients/optimizer/Mean_1_grad/Prod1optimizer/gradients/optimizer/Mean_1_grad/Maximum*
T0

.optimizer/gradients/optimizer/Mean_1_grad/CastCast2optimizer/gradients/optimizer/Mean_1_grad/floordiv*

SrcT0*
Truncate( *

DstT0
„
1optimizer/gradients/optimizer/Mean_1_grad/truedivRealDiv.optimizer/gradients/optimizer/Mean_1_grad/Tile.optimizer/gradients/optimizer/Mean_1_grad/Cast*
T0

/optimizer/gradients/policy_1/stack_grad/unstackUnpack,optimizer/gradients/policy_1/Sum_1_grad/Tile*
T0*	
num*

axis
_
.optimizer/gradients/optimizer/mul_1_grad/ShapeShapeoptimizer/Exp*
T0*
out_type0
h
0optimizer/gradients/optimizer/mul_1_grad/Shape_1Shapeoptimizer/ExpandDims*
T0*
out_type0
Ā
>optimizer/gradients/optimizer/mul_1_grad/BroadcastGradientArgsBroadcastGradientArgs.optimizer/gradients/optimizer/mul_1_grad/Shape0optimizer/gradients/optimizer/mul_1_grad/Shape_1*
T0

,optimizer/gradients/optimizer/mul_1_grad/MulMulCoptimizer/gradients/optimizer/Minimum_grad/tuple/control_dependencyoptimizer/ExpandDims*
T0
Ē
,optimizer/gradients/optimizer/mul_1_grad/SumSum,optimizer/gradients/optimizer/mul_1_grad/Mul>optimizer/gradients/optimizer/mul_1_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
°
0optimizer/gradients/optimizer/mul_1_grad/ReshapeReshape,optimizer/gradients/optimizer/mul_1_grad/Sum.optimizer/gradients/optimizer/mul_1_grad/Shape*
T0*
Tshape0

.optimizer/gradients/optimizer/mul_1_grad/Mul_1Muloptimizer/ExpCoptimizer/gradients/optimizer/Minimum_grad/tuple/control_dependency*
T0
Ķ
.optimizer/gradients/optimizer/mul_1_grad/Sum_1Sum.optimizer/gradients/optimizer/mul_1_grad/Mul_1@optimizer/gradients/optimizer/mul_1_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
¶
2optimizer/gradients/optimizer/mul_1_grad/Reshape_1Reshape.optimizer/gradients/optimizer/mul_1_grad/Sum_10optimizer/gradients/optimizer/mul_1_grad/Shape_1*
T0*
Tshape0
©
9optimizer/gradients/optimizer/mul_1_grad/tuple/group_depsNoOp1^optimizer/gradients/optimizer/mul_1_grad/Reshape3^optimizer/gradients/optimizer/mul_1_grad/Reshape_1

Aoptimizer/gradients/optimizer/mul_1_grad/tuple/control_dependencyIdentity0optimizer/gradients/optimizer/mul_1_grad/Reshape:^optimizer/gradients/optimizer/mul_1_grad/tuple/group_deps*C
_class9
75loc:@optimizer/gradients/optimizer/mul_1_grad/Reshape*
T0

Coptimizer/gradients/optimizer/mul_1_grad/tuple/control_dependency_1Identity2optimizer/gradients/optimizer/mul_1_grad/Reshape_1:^optimizer/gradients/optimizer/mul_1_grad/tuple/group_deps*
T0*E
_class;
97loc:@optimizer/gradients/optimizer/mul_1_grad/Reshape_1
k
.optimizer/gradients/optimizer/mul_2_grad/ShapeShapeoptimizer/clip_by_value_1*
T0*
out_type0
h
0optimizer/gradients/optimizer/mul_2_grad/Shape_1Shapeoptimizer/ExpandDims*
T0*
out_type0
Ā
>optimizer/gradients/optimizer/mul_2_grad/BroadcastGradientArgsBroadcastGradientArgs.optimizer/gradients/optimizer/mul_2_grad/Shape0optimizer/gradients/optimizer/mul_2_grad/Shape_1*
T0

,optimizer/gradients/optimizer/mul_2_grad/MulMulEoptimizer/gradients/optimizer/Minimum_grad/tuple/control_dependency_1optimizer/ExpandDims*
T0
Ē
,optimizer/gradients/optimizer/mul_2_grad/SumSum,optimizer/gradients/optimizer/mul_2_grad/Mul>optimizer/gradients/optimizer/mul_2_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
°
0optimizer/gradients/optimizer/mul_2_grad/ReshapeReshape,optimizer/gradients/optimizer/mul_2_grad/Sum.optimizer/gradients/optimizer/mul_2_grad/Shape*
T0*
Tshape0
 
.optimizer/gradients/optimizer/mul_2_grad/Mul_1Muloptimizer/clip_by_value_1Eoptimizer/gradients/optimizer/Minimum_grad/tuple/control_dependency_1*
T0
Ķ
.optimizer/gradients/optimizer/mul_2_grad/Sum_1Sum.optimizer/gradients/optimizer/mul_2_grad/Mul_1@optimizer/gradients/optimizer/mul_2_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
¶
2optimizer/gradients/optimizer/mul_2_grad/Reshape_1Reshape.optimizer/gradients/optimizer/mul_2_grad/Sum_10optimizer/gradients/optimizer/mul_2_grad/Shape_1*
T0*
Tshape0
©
9optimizer/gradients/optimizer/mul_2_grad/tuple/group_depsNoOp1^optimizer/gradients/optimizer/mul_2_grad/Reshape3^optimizer/gradients/optimizer/mul_2_grad/Reshape_1

Aoptimizer/gradients/optimizer/mul_2_grad/tuple/control_dependencyIdentity0optimizer/gradients/optimizer/mul_2_grad/Reshape:^optimizer/gradients/optimizer/mul_2_grad/tuple/group_deps*
T0*C
_class9
75loc:@optimizer/gradients/optimizer/mul_2_grad/Reshape

Coptimizer/gradients/optimizer/mul_2_grad/tuple/control_dependency_1Identity2optimizer/gradients/optimizer/mul_2_grad/Reshape_1:^optimizer/gradients/optimizer/mul_2_grad/tuple/group_deps*E
_class;
97loc:@optimizer/gradients/optimizer/mul_2_grad/Reshape_1*
T0
R
 optimizer/gradients/zeros_like_2	ZerosLikeoptimizer/DynamicPartition*
T0
c
9optimizer/gradients/optimizer/DynamicPartition_grad/ShapeShapeCast_2*
T0*
out_type0
g
9optimizer/gradients/optimizer/DynamicPartition_grad/ConstConst*
valueB: *
dtype0
Ü
8optimizer/gradients/optimizer/DynamicPartition_grad/ProdProd9optimizer/gradients/optimizer/DynamicPartition_grad/Shape9optimizer/gradients/optimizer/DynamicPartition_grad/Const*

Tidx0*
	keep_dims( *
T0
i
?optimizer/gradients/optimizer/DynamicPartition_grad/range/startConst*
value	B : *
dtype0
i
?optimizer/gradients/optimizer/DynamicPartition_grad/range/deltaConst*
value	B :*
dtype0

9optimizer/gradients/optimizer/DynamicPartition_grad/rangeRange?optimizer/gradients/optimizer/DynamicPartition_grad/range/start8optimizer/gradients/optimizer/DynamicPartition_grad/Prod?optimizer/gradients/optimizer/DynamicPartition_grad/range/delta*

Tidx0
Ó
;optimizer/gradients/optimizer/DynamicPartition_grad/ReshapeReshape9optimizer/gradients/optimizer/DynamicPartition_grad/range9optimizer/gradients/optimizer/DynamicPartition_grad/Shape*
Tshape0*
T0
¼
Doptimizer/gradients/optimizer/DynamicPartition_grad/DynamicPartitionDynamicPartition;optimizer/gradients/optimizer/DynamicPartition_grad/ReshapeCast_2*
T0*
num_partitions
Ē
Aoptimizer/gradients/optimizer/DynamicPartition_grad/DynamicStitchDynamicStitchDoptimizer/gradients/optimizer/DynamicPartition_grad/DynamicPartitionFoptimizer/gradients/optimizer/DynamicPartition_grad/DynamicPartition:1 optimizer/gradients/zeros_like_21optimizer/gradients/optimizer/Mean_1_grad/truediv*
N*
T0
p
;optimizer/gradients/optimizer/DynamicPartition_grad/Shape_1Shapeoptimizer/Maximum*
T0*
out_type0
ß
=optimizer/gradients/optimizer/DynamicPartition_grad/Reshape_1ReshapeAoptimizer/gradients/optimizer/DynamicPartition_grad/DynamicStitch;optimizer/gradients/optimizer/DynamicPartition_grad/Shape_1*
T0*
Tshape0
”
Soptimizer/gradients/policy_1/softmax_cross_entropy_with_logits/Reshape_2_grad/ShapeShape*policy_1/softmax_cross_entropy_with_logits*
T0*
out_type0
ż
Uoptimizer/gradients/policy_1/softmax_cross_entropy_with_logits/Reshape_2_grad/ReshapeReshape/optimizer/gradients/policy_1/stack_grad/unstackSoptimizer/gradients/policy_1/softmax_cross_entropy_with_logits/Reshape_2_grad/Shape*
T0*
Tshape0
}
8optimizer/gradients/optimizer/clip_by_value_1_grad/ShapeShape!optimizer/clip_by_value_1/Minimum*
T0*
out_type0
c
:optimizer/gradients/optimizer/clip_by_value_1_grad/Shape_1Const*
valueB *
dtype0

:optimizer/gradients/optimizer/clip_by_value_1_grad/Shape_2ShapeAoptimizer/gradients/optimizer/mul_2_grad/tuple/control_dependency*
T0*
out_type0
k
>optimizer/gradients/optimizer/clip_by_value_1_grad/zeros/ConstConst*
valueB
 *    *
dtype0
×
8optimizer/gradients/optimizer/clip_by_value_1_grad/zerosFill:optimizer/gradients/optimizer/clip_by_value_1_grad/Shape_2>optimizer/gradients/optimizer/clip_by_value_1_grad/zeros/Const*

index_type0*
T0

?optimizer/gradients/optimizer/clip_by_value_1_grad/GreaterEqualGreaterEqual!optimizer/clip_by_value_1/Minimumoptimizer/sub_2*
T0
ą
Hoptimizer/gradients/optimizer/clip_by_value_1_grad/BroadcastGradientArgsBroadcastGradientArgs8optimizer/gradients/optimizer/clip_by_value_1_grad/Shape:optimizer/gradients/optimizer/clip_by_value_1_grad/Shape_1*
T0

9optimizer/gradients/optimizer/clip_by_value_1_grad/SelectSelect?optimizer/gradients/optimizer/clip_by_value_1_grad/GreaterEqualAoptimizer/gradients/optimizer/mul_2_grad/tuple/control_dependency8optimizer/gradients/optimizer/clip_by_value_1_grad/zeros*
T0
č
6optimizer/gradients/optimizer/clip_by_value_1_grad/SumSum9optimizer/gradients/optimizer/clip_by_value_1_grad/SelectHoptimizer/gradients/optimizer/clip_by_value_1_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
Ī
:optimizer/gradients/optimizer/clip_by_value_1_grad/ReshapeReshape6optimizer/gradients/optimizer/clip_by_value_1_grad/Sum8optimizer/gradients/optimizer/clip_by_value_1_grad/Shape*
T0*
Tshape0

;optimizer/gradients/optimizer/clip_by_value_1_grad/Select_1Select?optimizer/gradients/optimizer/clip_by_value_1_grad/GreaterEqual8optimizer/gradients/optimizer/clip_by_value_1_grad/zerosAoptimizer/gradients/optimizer/mul_2_grad/tuple/control_dependency*
T0
ī
8optimizer/gradients/optimizer/clip_by_value_1_grad/Sum_1Sum;optimizer/gradients/optimizer/clip_by_value_1_grad/Select_1Joptimizer/gradients/optimizer/clip_by_value_1_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
Ō
<optimizer/gradients/optimizer/clip_by_value_1_grad/Reshape_1Reshape8optimizer/gradients/optimizer/clip_by_value_1_grad/Sum_1:optimizer/gradients/optimizer/clip_by_value_1_grad/Shape_1*
T0*
Tshape0
Ē
Coptimizer/gradients/optimizer/clip_by_value_1_grad/tuple/group_depsNoOp;^optimizer/gradients/optimizer/clip_by_value_1_grad/Reshape=^optimizer/gradients/optimizer/clip_by_value_1_grad/Reshape_1
±
Koptimizer/gradients/optimizer/clip_by_value_1_grad/tuple/control_dependencyIdentity:optimizer/gradients/optimizer/clip_by_value_1_grad/ReshapeD^optimizer/gradients/optimizer/clip_by_value_1_grad/tuple/group_deps*M
_classC
A?loc:@optimizer/gradients/optimizer/clip_by_value_1_grad/Reshape*
T0
·
Moptimizer/gradients/optimizer/clip_by_value_1_grad/tuple/control_dependency_1Identity<optimizer/gradients/optimizer/clip_by_value_1_grad/Reshape_1D^optimizer/gradients/optimizer/clip_by_value_1_grad/tuple/group_deps*
T0*O
_classE
CAloc:@optimizer/gradients/optimizer/clip_by_value_1_grad/Reshape_1
o
0optimizer/gradients/optimizer/Maximum_grad/ShapeShapeoptimizer/SquaredDifference*
T0*
out_type0
s
2optimizer/gradients/optimizer/Maximum_grad/Shape_1Shapeoptimizer/SquaredDifference_1*
T0*
out_type0

2optimizer/gradients/optimizer/Maximum_grad/Shape_2Shape=optimizer/gradients/optimizer/DynamicPartition_grad/Reshape_1*
out_type0*
T0
c
6optimizer/gradients/optimizer/Maximum_grad/zeros/ConstConst*
valueB
 *    *
dtype0
æ
0optimizer/gradients/optimizer/Maximum_grad/zerosFill2optimizer/gradients/optimizer/Maximum_grad/Shape_26optimizer/gradients/optimizer/Maximum_grad/zeros/Const*
T0*

index_type0

7optimizer/gradients/optimizer/Maximum_grad/GreaterEqualGreaterEqualoptimizer/SquaredDifferenceoptimizer/SquaredDifference_1*
T0
Č
@optimizer/gradients/optimizer/Maximum_grad/BroadcastGradientArgsBroadcastGradientArgs0optimizer/gradients/optimizer/Maximum_grad/Shape2optimizer/gradients/optimizer/Maximum_grad/Shape_1*
T0
ī
1optimizer/gradients/optimizer/Maximum_grad/SelectSelect7optimizer/gradients/optimizer/Maximum_grad/GreaterEqual=optimizer/gradients/optimizer/DynamicPartition_grad/Reshape_10optimizer/gradients/optimizer/Maximum_grad/zeros*
T0
Š
.optimizer/gradients/optimizer/Maximum_grad/SumSum1optimizer/gradients/optimizer/Maximum_grad/Select@optimizer/gradients/optimizer/Maximum_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
¶
2optimizer/gradients/optimizer/Maximum_grad/ReshapeReshape.optimizer/gradients/optimizer/Maximum_grad/Sum0optimizer/gradients/optimizer/Maximum_grad/Shape*
T0*
Tshape0
š
3optimizer/gradients/optimizer/Maximum_grad/Select_1Select7optimizer/gradients/optimizer/Maximum_grad/GreaterEqual0optimizer/gradients/optimizer/Maximum_grad/zeros=optimizer/gradients/optimizer/DynamicPartition_grad/Reshape_1*
T0
Ö
0optimizer/gradients/optimizer/Maximum_grad/Sum_1Sum3optimizer/gradients/optimizer/Maximum_grad/Select_1Boptimizer/gradients/optimizer/Maximum_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
¼
4optimizer/gradients/optimizer/Maximum_grad/Reshape_1Reshape0optimizer/gradients/optimizer/Maximum_grad/Sum_12optimizer/gradients/optimizer/Maximum_grad/Shape_1*
Tshape0*
T0
Æ
;optimizer/gradients/optimizer/Maximum_grad/tuple/group_depsNoOp3^optimizer/gradients/optimizer/Maximum_grad/Reshape5^optimizer/gradients/optimizer/Maximum_grad/Reshape_1

Coptimizer/gradients/optimizer/Maximum_grad/tuple/control_dependencyIdentity2optimizer/gradients/optimizer/Maximum_grad/Reshape<^optimizer/gradients/optimizer/Maximum_grad/tuple/group_deps*
T0*E
_class;
97loc:@optimizer/gradients/optimizer/Maximum_grad/Reshape

Eoptimizer/gradients/optimizer/Maximum_grad/tuple/control_dependency_1Identity4optimizer/gradients/optimizer/Maximum_grad/Reshape_1<^optimizer/gradients/optimizer/Maximum_grad/tuple/group_deps*G
_class=
;9loc:@optimizer/gradients/optimizer/Maximum_grad/Reshape_1*
T0
d
 optimizer/gradients/zeros_like_3	ZerosLike,policy_1/softmax_cross_entropy_with_logits:1*
T0

Roptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_grad/ExpandDims/dimConst*
valueB :
’’’’’’’’’*
dtype0

Noptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_grad/ExpandDims
ExpandDimsUoptimizer/gradients/policy_1/softmax_cross_entropy_with_logits/Reshape_2_grad/ReshapeRoptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_grad/ExpandDims/dim*

Tdim0*
T0
Õ
Goptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_grad/mulMulNoptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_grad/ExpandDims,policy_1/softmax_cross_entropy_with_logits:1*
T0

Noptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_grad/LogSoftmax
LogSoftmax2policy_1/softmax_cross_entropy_with_logits/Reshape*
T0
§
Goptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_grad/NegNegNoptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_grad/LogSoftmax*
T0

Toptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_grad/ExpandDims_1/dimConst*
dtype0*
valueB :
’’’’’’’’’
 
Poptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_grad/ExpandDims_1
ExpandDimsUoptimizer/gradients/policy_1/softmax_cross_entropy_with_logits/Reshape_2_grad/ReshapeToptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_grad/ExpandDims_1/dim*

Tdim0*
T0
ō
Ioptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_grad/mul_1MulPoptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_grad/ExpandDims_1Goptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_grad/Neg*
T0
ņ
Toptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_grad/tuple/group_depsNoOpH^optimizer/gradients/policy_1/softmax_cross_entropy_with_logits_grad/mulJ^optimizer/gradients/policy_1/softmax_cross_entropy_with_logits_grad/mul_1
ķ
\optimizer/gradients/policy_1/softmax_cross_entropy_with_logits_grad/tuple/control_dependencyIdentityGoptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_grad/mulU^optimizer/gradients/policy_1/softmax_cross_entropy_with_logits_grad/tuple/group_deps*
T0*Z
_classP
NLloc:@optimizer/gradients/policy_1/softmax_cross_entropy_with_logits_grad/mul
ó
^optimizer/gradients/policy_1/softmax_cross_entropy_with_logits_grad/tuple/control_dependency_1IdentityIoptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_grad/mul_1U^optimizer/gradients/policy_1/softmax_cross_entropy_with_logits_grad/tuple/group_deps*\
_classR
PNloc:@optimizer/gradients/policy_1/softmax_cross_entropy_with_logits_grad/mul_1*
T0
q
@optimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/ShapeShapeoptimizer/Exp*
out_type0*
T0
k
Boptimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/Shape_1Const*
valueB *
dtype0
±
Boptimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/Shape_2ShapeKoptimizer/gradients/optimizer/clip_by_value_1_grad/tuple/control_dependency*
T0*
out_type0
s
Foptimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/zeros/ConstConst*
valueB
 *    *
dtype0
ļ
@optimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/zerosFillBoptimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/Shape_2Foptimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/zeros/Const*
T0*

index_type0
z
Doptimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/LessEqual	LessEqualoptimizer/Expoptimizer/add_4*
T0
ų
Poptimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/BroadcastGradientArgsBroadcastGradientArgs@optimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/ShapeBoptimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/Shape_1*
T0
©
Aoptimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/SelectSelectDoptimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/LessEqualKoptimizer/gradients/optimizer/clip_by_value_1_grad/tuple/control_dependency@optimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/zeros*
T0

>optimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/SumSumAoptimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/SelectPoptimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
ę
Boptimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/ReshapeReshape>optimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/Sum@optimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/Shape*
T0*
Tshape0
«
Coptimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/Select_1SelectDoptimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/LessEqual@optimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/zerosKoptimizer/gradients/optimizer/clip_by_value_1_grad/tuple/control_dependency*
T0

@optimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/Sum_1SumCoptimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/Select_1Roptimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
ģ
Doptimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/Reshape_1Reshape@optimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/Sum_1Boptimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/Shape_1*
T0*
Tshape0
ß
Koptimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/tuple/group_depsNoOpC^optimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/ReshapeE^optimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/Reshape_1
Ń
Soptimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/tuple/control_dependencyIdentityBoptimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/ReshapeL^optimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/tuple/group_deps*
T0*U
_classK
IGloc:@optimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/Reshape
×
Uoptimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/tuple/control_dependency_1IdentityDoptimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/Reshape_1L^optimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/tuple/group_deps*
T0*W
_classM
KIloc:@optimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/Reshape_1
y
:optimizer/gradients/optimizer/SquaredDifference_grad/ShapeShapeoptimizer/extrinsic_returns*
T0*
out_type0
o
<optimizer/gradients/optimizer/SquaredDifference_grad/Shape_1Shapeoptimizer/Sum_3*
T0*
out_type0
ę
Joptimizer/gradients/optimizer/SquaredDifference_grad/BroadcastGradientArgsBroadcastGradientArgs:optimizer/gradients/optimizer/SquaredDifference_grad/Shape<optimizer/gradients/optimizer/SquaredDifference_grad/Shape_1*
T0
®
;optimizer/gradients/optimizer/SquaredDifference_grad/scalarConstD^optimizer/gradients/optimizer/Maximum_grad/tuple/control_dependency*
valueB
 *   @*
dtype0
Ź
8optimizer/gradients/optimizer/SquaredDifference_grad/MulMul;optimizer/gradients/optimizer/SquaredDifference_grad/scalarCoptimizer/gradients/optimizer/Maximum_grad/tuple/control_dependency*
T0
¼
8optimizer/gradients/optimizer/SquaredDifference_grad/subSuboptimizer/extrinsic_returnsoptimizer/Sum_3D^optimizer/gradients/optimizer/Maximum_grad/tuple/control_dependency*
T0
¾
:optimizer/gradients/optimizer/SquaredDifference_grad/mul_1Mul8optimizer/gradients/optimizer/SquaredDifference_grad/Mul8optimizer/gradients/optimizer/SquaredDifference_grad/sub*
T0
ķ
8optimizer/gradients/optimizer/SquaredDifference_grad/SumSum:optimizer/gradients/optimizer/SquaredDifference_grad/mul_1Joptimizer/gradients/optimizer/SquaredDifference_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
Ō
<optimizer/gradients/optimizer/SquaredDifference_grad/ReshapeReshape8optimizer/gradients/optimizer/SquaredDifference_grad/Sum:optimizer/gradients/optimizer/SquaredDifference_grad/Shape*
T0*
Tshape0
ń
:optimizer/gradients/optimizer/SquaredDifference_grad/Sum_1Sum:optimizer/gradients/optimizer/SquaredDifference_grad/mul_1Loptimizer/gradients/optimizer/SquaredDifference_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
Ś
>optimizer/gradients/optimizer/SquaredDifference_grad/Reshape_1Reshape:optimizer/gradients/optimizer/SquaredDifference_grad/Sum_1<optimizer/gradients/optimizer/SquaredDifference_grad/Shape_1*
T0*
Tshape0

8optimizer/gradients/optimizer/SquaredDifference_grad/NegNeg>optimizer/gradients/optimizer/SquaredDifference_grad/Reshape_1*
T0
Ē
Eoptimizer/gradients/optimizer/SquaredDifference_grad/tuple/group_depsNoOp9^optimizer/gradients/optimizer/SquaredDifference_grad/Neg=^optimizer/gradients/optimizer/SquaredDifference_grad/Reshape
¹
Moptimizer/gradients/optimizer/SquaredDifference_grad/tuple/control_dependencyIdentity<optimizer/gradients/optimizer/SquaredDifference_grad/ReshapeF^optimizer/gradients/optimizer/SquaredDifference_grad/tuple/group_deps*
T0*O
_classE
CAloc:@optimizer/gradients/optimizer/SquaredDifference_grad/Reshape
³
Ooptimizer/gradients/optimizer/SquaredDifference_grad/tuple/control_dependency_1Identity8optimizer/gradients/optimizer/SquaredDifference_grad/NegF^optimizer/gradients/optimizer/SquaredDifference_grad/tuple/group_deps*
T0*K
_classA
?=loc:@optimizer/gradients/optimizer/SquaredDifference_grad/Neg
{
<optimizer/gradients/optimizer/SquaredDifference_1_grad/ShapeShapeoptimizer/extrinsic_returns*
T0*
out_type0
q
>optimizer/gradients/optimizer/SquaredDifference_1_grad/Shape_1Shapeoptimizer/add_3*
T0*
out_type0
ģ
Loptimizer/gradients/optimizer/SquaredDifference_1_grad/BroadcastGradientArgsBroadcastGradientArgs<optimizer/gradients/optimizer/SquaredDifference_1_grad/Shape>optimizer/gradients/optimizer/SquaredDifference_1_grad/Shape_1*
T0
²
=optimizer/gradients/optimizer/SquaredDifference_1_grad/scalarConstF^optimizer/gradients/optimizer/Maximum_grad/tuple/control_dependency_1*
valueB
 *   @*
dtype0
Š
:optimizer/gradients/optimizer/SquaredDifference_1_grad/MulMul=optimizer/gradients/optimizer/SquaredDifference_1_grad/scalarEoptimizer/gradients/optimizer/Maximum_grad/tuple/control_dependency_1*
T0
Ą
:optimizer/gradients/optimizer/SquaredDifference_1_grad/subSuboptimizer/extrinsic_returnsoptimizer/add_3F^optimizer/gradients/optimizer/Maximum_grad/tuple/control_dependency_1*
T0
Ä
<optimizer/gradients/optimizer/SquaredDifference_1_grad/mul_1Mul:optimizer/gradients/optimizer/SquaredDifference_1_grad/Mul:optimizer/gradients/optimizer/SquaredDifference_1_grad/sub*
T0
ó
:optimizer/gradients/optimizer/SquaredDifference_1_grad/SumSum<optimizer/gradients/optimizer/SquaredDifference_1_grad/mul_1Loptimizer/gradients/optimizer/SquaredDifference_1_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
Ś
>optimizer/gradients/optimizer/SquaredDifference_1_grad/ReshapeReshape:optimizer/gradients/optimizer/SquaredDifference_1_grad/Sum<optimizer/gradients/optimizer/SquaredDifference_1_grad/Shape*
T0*
Tshape0
÷
<optimizer/gradients/optimizer/SquaredDifference_1_grad/Sum_1Sum<optimizer/gradients/optimizer/SquaredDifference_1_grad/mul_1Noptimizer/gradients/optimizer/SquaredDifference_1_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
ą
@optimizer/gradients/optimizer/SquaredDifference_1_grad/Reshape_1Reshape<optimizer/gradients/optimizer/SquaredDifference_1_grad/Sum_1>optimizer/gradients/optimizer/SquaredDifference_1_grad/Shape_1*
T0*
Tshape0

:optimizer/gradients/optimizer/SquaredDifference_1_grad/NegNeg@optimizer/gradients/optimizer/SquaredDifference_1_grad/Reshape_1*
T0
Ķ
Goptimizer/gradients/optimizer/SquaredDifference_1_grad/tuple/group_depsNoOp;^optimizer/gradients/optimizer/SquaredDifference_1_grad/Neg?^optimizer/gradients/optimizer/SquaredDifference_1_grad/Reshape
Į
Ooptimizer/gradients/optimizer/SquaredDifference_1_grad/tuple/control_dependencyIdentity>optimizer/gradients/optimizer/SquaredDifference_1_grad/ReshapeH^optimizer/gradients/optimizer/SquaredDifference_1_grad/tuple/group_deps*Q
_classG
ECloc:@optimizer/gradients/optimizer/SquaredDifference_1_grad/Reshape*
T0
»
Qoptimizer/gradients/optimizer/SquaredDifference_1_grad/tuple/control_dependency_1Identity:optimizer/gradients/optimizer/SquaredDifference_1_grad/NegH^optimizer/gradients/optimizer/SquaredDifference_1_grad/tuple/group_deps*
T0*M
_classC
A?loc:@optimizer/gradients/optimizer/SquaredDifference_1_grad/Neg

Qoptimizer/gradients/policy_1/softmax_cross_entropy_with_logits/Reshape_grad/ShapeShapepolicy_1/strided_slice_3*
T0*
out_type0
¦
Soptimizer/gradients/policy_1/softmax_cross_entropy_with_logits/Reshape_grad/ReshapeReshape\optimizer/gradients/policy_1/softmax_cross_entropy_with_logits_grad/tuple/control_dependencyQoptimizer/gradients/policy_1/softmax_cross_entropy_with_logits/Reshape_grad/Shape*
T0*
Tshape0

Soptimizer/gradients/policy_1/softmax_cross_entropy_with_logits/Reshape_1_grad/ShapeShapepolicy_1/Softmax_1*
T0*
out_type0
¬
Uoptimizer/gradients/policy_1/softmax_cross_entropy_with_logits/Reshape_1_grad/ReshapeReshape^optimizer/gradients/policy_1/softmax_cross_entropy_with_logits_grad/tuple/control_dependency_1Soptimizer/gradients/policy_1/softmax_cross_entropy_with_logits/Reshape_1_grad/Shape*
T0*
Tshape0

optimizer/gradients/AddNAddNAoptimizer/gradients/optimizer/mul_1_grad/tuple/control_dependencySoptimizer/gradients/optimizer/clip_by_value_1/Minimum_grad/tuple/control_dependency*
T0*C
_class9
75loc:@optimizer/gradients/optimizer/mul_1_grad/Reshape*
N
c
*optimizer/gradients/optimizer/Exp_grad/mulMuloptimizer/gradients/AddNoptimizer/Exp*
T0
s
.optimizer/gradients/optimizer/Sum_3_grad/ShapeShape!optimizer/extrinsic_value/BiasAdd*
T0*
out_type0

-optimizer/gradients/optimizer/Sum_3_grad/SizeConst*A
_class7
53loc:@optimizer/gradients/optimizer/Sum_3_grad/Shape*
value	B :*
dtype0
Ń
,optimizer/gradients/optimizer/Sum_3_grad/addAdd!optimizer/Sum_3/reduction_indices-optimizer/gradients/optimizer/Sum_3_grad/Size*
T0*A
_class7
53loc:@optimizer/gradients/optimizer/Sum_3_grad/Shape
į
,optimizer/gradients/optimizer/Sum_3_grad/modFloorMod,optimizer/gradients/optimizer/Sum_3_grad/add-optimizer/gradients/optimizer/Sum_3_grad/Size*
T0*A
_class7
53loc:@optimizer/gradients/optimizer/Sum_3_grad/Shape

0optimizer/gradients/optimizer/Sum_3_grad/Shape_1Const*A
_class7
53loc:@optimizer/gradients/optimizer/Sum_3_grad/Shape*
valueB *
dtype0
”
4optimizer/gradients/optimizer/Sum_3_grad/range/startConst*A
_class7
53loc:@optimizer/gradients/optimizer/Sum_3_grad/Shape*
value	B : *
dtype0
”
4optimizer/gradients/optimizer/Sum_3_grad/range/deltaConst*A
_class7
53loc:@optimizer/gradients/optimizer/Sum_3_grad/Shape*
value	B :*
dtype0
”
.optimizer/gradients/optimizer/Sum_3_grad/rangeRange4optimizer/gradients/optimizer/Sum_3_grad/range/start-optimizer/gradients/optimizer/Sum_3_grad/Size4optimizer/gradients/optimizer/Sum_3_grad/range/delta*A
_class7
53loc:@optimizer/gradients/optimizer/Sum_3_grad/Shape*

Tidx0
 
3optimizer/gradients/optimizer/Sum_3_grad/Fill/valueConst*A
_class7
53loc:@optimizer/gradients/optimizer/Sum_3_grad/Shape*
value	B :*
dtype0
ś
-optimizer/gradients/optimizer/Sum_3_grad/FillFill0optimizer/gradients/optimizer/Sum_3_grad/Shape_13optimizer/gradients/optimizer/Sum_3_grad/Fill/value*
T0*A
_class7
53loc:@optimizer/gradients/optimizer/Sum_3_grad/Shape*

index_type0
Ł
6optimizer/gradients/optimizer/Sum_3_grad/DynamicStitchDynamicStitch.optimizer/gradients/optimizer/Sum_3_grad/range,optimizer/gradients/optimizer/Sum_3_grad/mod.optimizer/gradients/optimizer/Sum_3_grad/Shape-optimizer/gradients/optimizer/Sum_3_grad/Fill*
T0*A
_class7
53loc:@optimizer/gradients/optimizer/Sum_3_grad/Shape*
N

2optimizer/gradients/optimizer/Sum_3_grad/Maximum/yConst*A
_class7
53loc:@optimizer/gradients/optimizer/Sum_3_grad/Shape*
value	B :*
dtype0
ó
0optimizer/gradients/optimizer/Sum_3_grad/MaximumMaximum6optimizer/gradients/optimizer/Sum_3_grad/DynamicStitch2optimizer/gradients/optimizer/Sum_3_grad/Maximum/y*
T0*A
_class7
53loc:@optimizer/gradients/optimizer/Sum_3_grad/Shape
ė
1optimizer/gradients/optimizer/Sum_3_grad/floordivFloorDiv.optimizer/gradients/optimizer/Sum_3_grad/Shape0optimizer/gradients/optimizer/Sum_3_grad/Maximum*
T0*A
_class7
53loc:@optimizer/gradients/optimizer/Sum_3_grad/Shape
Ū
0optimizer/gradients/optimizer/Sum_3_grad/ReshapeReshapeOoptimizer/gradients/optimizer/SquaredDifference_grad/tuple/control_dependency_16optimizer/gradients/optimizer/Sum_3_grad/DynamicStitch*
T0*
Tshape0
µ
-optimizer/gradients/optimizer/Sum_3_grad/TileTile0optimizer/gradients/optimizer/Sum_3_grad/Reshape1optimizer/gradients/optimizer/Sum_3_grad/floordiv*

Tmultiples0*
T0
t
.optimizer/gradients/optimizer/add_3_grad/ShapeShape"optimizer/extrinsic_value_estimate*
out_type0*
T0
k
0optimizer/gradients/optimizer/add_3_grad/Shape_1Shapeoptimizer/clip_by_value*
T0*
out_type0
Ā
>optimizer/gradients/optimizer/add_3_grad/BroadcastGradientArgsBroadcastGradientArgs.optimizer/gradients/optimizer/add_3_grad/Shape0optimizer/gradients/optimizer/add_3_grad/Shape_1*
T0
ģ
,optimizer/gradients/optimizer/add_3_grad/SumSumQoptimizer/gradients/optimizer/SquaredDifference_1_grad/tuple/control_dependency_1>optimizer/gradients/optimizer/add_3_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
°
0optimizer/gradients/optimizer/add_3_grad/ReshapeReshape,optimizer/gradients/optimizer/add_3_grad/Sum.optimizer/gradients/optimizer/add_3_grad/Shape*
T0*
Tshape0
š
.optimizer/gradients/optimizer/add_3_grad/Sum_1SumQoptimizer/gradients/optimizer/SquaredDifference_1_grad/tuple/control_dependency_1@optimizer/gradients/optimizer/add_3_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
¶
2optimizer/gradients/optimizer/add_3_grad/Reshape_1Reshape.optimizer/gradients/optimizer/add_3_grad/Sum_10optimizer/gradients/optimizer/add_3_grad/Shape_1*
Tshape0*
T0
©
9optimizer/gradients/optimizer/add_3_grad/tuple/group_depsNoOp1^optimizer/gradients/optimizer/add_3_grad/Reshape3^optimizer/gradients/optimizer/add_3_grad/Reshape_1

Aoptimizer/gradients/optimizer/add_3_grad/tuple/control_dependencyIdentity0optimizer/gradients/optimizer/add_3_grad/Reshape:^optimizer/gradients/optimizer/add_3_grad/tuple/group_deps*
T0*C
_class9
75loc:@optimizer/gradients/optimizer/add_3_grad/Reshape

Coptimizer/gradients/optimizer/add_3_grad/tuple/control_dependency_1Identity2optimizer/gradients/optimizer/add_3_grad/Reshape_1:^optimizer/gradients/optimizer/add_3_grad/tuple/group_deps*E
_class;
97loc:@optimizer/gradients/optimizer/add_3_grad/Reshape_1*
T0
l
7optimizer/gradients/policy_1/strided_slice_3_grad/ShapeShapepolicy_1/concat_2*
T0*
out_type0
Ā
Boptimizer/gradients/policy_1/strided_slice_3_grad/StridedSliceGradStridedSliceGrad7optimizer/gradients/policy_1/strided_slice_3_grad/Shapepolicy_1/strided_slice_3/stack policy_1/strided_slice_3/stack_1 policy_1/strided_slice_3/stack_2Soptimizer/gradients/policy_1/softmax_cross_entropy_with_logits/Reshape_grad/Reshape*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*
T0*
Index0
Ŗ
/optimizer/gradients/policy_1/Softmax_1_grad/mulMulUoptimizer/gradients/policy_1/softmax_cross_entropy_with_logits/Reshape_1_grad/Reshapepolicy_1/Softmax_1*
T0
t
Aoptimizer/gradients/policy_1/Softmax_1_grad/Sum/reduction_indicesConst*
valueB :
’’’’’’’’’*
dtype0
Š
/optimizer/gradients/policy_1/Softmax_1_grad/SumSum/optimizer/gradients/policy_1/Softmax_1_grad/mulAoptimizer/gradients/policy_1/Softmax_1_grad/Sum/reduction_indices*

Tidx0*
	keep_dims(*
T0
Ē
/optimizer/gradients/policy_1/Softmax_1_grad/subSubUoptimizer/gradients/policy_1/softmax_cross_entropy_with_logits/Reshape_1_grad/Reshape/optimizer/gradients/policy_1/Softmax_1_grad/Sum*
T0

1optimizer/gradients/policy_1/Softmax_1_grad/mul_1Mul/optimizer/gradients/policy_1/Softmax_1_grad/subpolicy_1/Softmax_1*
T0
`
.optimizer/gradients/optimizer/sub_1_grad/ShapeShapepolicy_1/Sum_2*
T0*
out_type0
c
0optimizer/gradients/optimizer/sub_1_grad/Shape_1Shapeoptimizer/Sum_1*
T0*
out_type0
Ā
>optimizer/gradients/optimizer/sub_1_grad/BroadcastGradientArgsBroadcastGradientArgs.optimizer/gradients/optimizer/sub_1_grad/Shape0optimizer/gradients/optimizer/sub_1_grad/Shape_1*
T0
Å
,optimizer/gradients/optimizer/sub_1_grad/SumSum*optimizer/gradients/optimizer/Exp_grad/mul>optimizer/gradients/optimizer/sub_1_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
°
0optimizer/gradients/optimizer/sub_1_grad/ReshapeReshape,optimizer/gradients/optimizer/sub_1_grad/Sum.optimizer/gradients/optimizer/sub_1_grad/Shape*
T0*
Tshape0
É
.optimizer/gradients/optimizer/sub_1_grad/Sum_1Sum*optimizer/gradients/optimizer/Exp_grad/mul@optimizer/gradients/optimizer/sub_1_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
l
,optimizer/gradients/optimizer/sub_1_grad/NegNeg.optimizer/gradients/optimizer/sub_1_grad/Sum_1*
T0
“
2optimizer/gradients/optimizer/sub_1_grad/Reshape_1Reshape,optimizer/gradients/optimizer/sub_1_grad/Neg0optimizer/gradients/optimizer/sub_1_grad/Shape_1*
T0*
Tshape0
©
9optimizer/gradients/optimizer/sub_1_grad/tuple/group_depsNoOp1^optimizer/gradients/optimizer/sub_1_grad/Reshape3^optimizer/gradients/optimizer/sub_1_grad/Reshape_1

Aoptimizer/gradients/optimizer/sub_1_grad/tuple/control_dependencyIdentity0optimizer/gradients/optimizer/sub_1_grad/Reshape:^optimizer/gradients/optimizer/sub_1_grad/tuple/group_deps*
T0*C
_class9
75loc:@optimizer/gradients/optimizer/sub_1_grad/Reshape

Coptimizer/gradients/optimizer/sub_1_grad/tuple/control_dependency_1Identity2optimizer/gradients/optimizer/sub_1_grad/Reshape_1:^optimizer/gradients/optimizer/sub_1_grad/tuple/group_deps*
T0*E
_class;
97loc:@optimizer/gradients/optimizer/sub_1_grad/Reshape_1
y
6optimizer/gradients/optimizer/clip_by_value_grad/ShapeShapeoptimizer/clip_by_value/Minimum*
T0*
out_type0
a
8optimizer/gradients/optimizer/clip_by_value_grad/Shape_1Const*
valueB *
dtype0

8optimizer/gradients/optimizer/clip_by_value_grad/Shape_2ShapeCoptimizer/gradients/optimizer/add_3_grad/tuple/control_dependency_1*
T0*
out_type0
i
<optimizer/gradients/optimizer/clip_by_value_grad/zeros/ConstConst*
valueB
 *    *
dtype0
Ń
6optimizer/gradients/optimizer/clip_by_value_grad/zerosFill8optimizer/gradients/optimizer/clip_by_value_grad/Shape_2<optimizer/gradients/optimizer/clip_by_value_grad/zeros/Const*
T0*

index_type0

=optimizer/gradients/optimizer/clip_by_value_grad/GreaterEqualGreaterEqualoptimizer/clip_by_value/Minimumoptimizer/Neg_1*
T0
Ś
Foptimizer/gradients/optimizer/clip_by_value_grad/BroadcastGradientArgsBroadcastGradientArgs6optimizer/gradients/optimizer/clip_by_value_grad/Shape8optimizer/gradients/optimizer/clip_by_value_grad/Shape_1*
T0

7optimizer/gradients/optimizer/clip_by_value_grad/SelectSelect=optimizer/gradients/optimizer/clip_by_value_grad/GreaterEqualCoptimizer/gradients/optimizer/add_3_grad/tuple/control_dependency_16optimizer/gradients/optimizer/clip_by_value_grad/zeros*
T0
ā
4optimizer/gradients/optimizer/clip_by_value_grad/SumSum7optimizer/gradients/optimizer/clip_by_value_grad/SelectFoptimizer/gradients/optimizer/clip_by_value_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
Č
8optimizer/gradients/optimizer/clip_by_value_grad/ReshapeReshape4optimizer/gradients/optimizer/clip_by_value_grad/Sum6optimizer/gradients/optimizer/clip_by_value_grad/Shape*
T0*
Tshape0

9optimizer/gradients/optimizer/clip_by_value_grad/Select_1Select=optimizer/gradients/optimizer/clip_by_value_grad/GreaterEqual6optimizer/gradients/optimizer/clip_by_value_grad/zerosCoptimizer/gradients/optimizer/add_3_grad/tuple/control_dependency_1*
T0
č
6optimizer/gradients/optimizer/clip_by_value_grad/Sum_1Sum9optimizer/gradients/optimizer/clip_by_value_grad/Select_1Hoptimizer/gradients/optimizer/clip_by_value_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
Ī
:optimizer/gradients/optimizer/clip_by_value_grad/Reshape_1Reshape6optimizer/gradients/optimizer/clip_by_value_grad/Sum_18optimizer/gradients/optimizer/clip_by_value_grad/Shape_1*
T0*
Tshape0
Į
Aoptimizer/gradients/optimizer/clip_by_value_grad/tuple/group_depsNoOp9^optimizer/gradients/optimizer/clip_by_value_grad/Reshape;^optimizer/gradients/optimizer/clip_by_value_grad/Reshape_1
©
Ioptimizer/gradients/optimizer/clip_by_value_grad/tuple/control_dependencyIdentity8optimizer/gradients/optimizer/clip_by_value_grad/ReshapeB^optimizer/gradients/optimizer/clip_by_value_grad/tuple/group_deps*
T0*K
_classA
?=loc:@optimizer/gradients/optimizer/clip_by_value_grad/Reshape
Æ
Koptimizer/gradients/optimizer/clip_by_value_grad/tuple/control_dependency_1Identity:optimizer/gradients/optimizer/clip_by_value_grad/Reshape_1B^optimizer/gradients/optimizer/clip_by_value_grad/tuple/group_deps*
T0*M
_classC
A?loc:@optimizer/gradients/optimizer/clip_by_value_grad/Reshape_1
l
7optimizer/gradients/policy_1/strided_slice_2_grad/ShapeShapepolicy_1/concat_2*
T0*
out_type0
 
Boptimizer/gradients/policy_1/strided_slice_2_grad/StridedSliceGradStridedSliceGrad7optimizer/gradients/policy_1/strided_slice_2_grad/Shapepolicy_1/strided_slice_2/stack policy_1/strided_slice_2/stack_1 policy_1/strided_slice_2/stack_21optimizer/gradients/policy_1/Softmax_1_grad/mul_1*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
a
-optimizer/gradients/policy_1/Sum_2_grad/ShapeShapepolicy_1/stack_1*
T0*
out_type0

,optimizer/gradients/policy_1/Sum_2_grad/SizeConst*@
_class6
42loc:@optimizer/gradients/policy_1/Sum_2_grad/Shape*
value	B :*
dtype0
Ķ
+optimizer/gradients/policy_1/Sum_2_grad/addAdd policy_1/Sum_2/reduction_indices,optimizer/gradients/policy_1/Sum_2_grad/Size*
T0*@
_class6
42loc:@optimizer/gradients/policy_1/Sum_2_grad/Shape
Ż
+optimizer/gradients/policy_1/Sum_2_grad/modFloorMod+optimizer/gradients/policy_1/Sum_2_grad/add,optimizer/gradients/policy_1/Sum_2_grad/Size*
T0*@
_class6
42loc:@optimizer/gradients/policy_1/Sum_2_grad/Shape

/optimizer/gradients/policy_1/Sum_2_grad/Shape_1Const*@
_class6
42loc:@optimizer/gradients/policy_1/Sum_2_grad/Shape*
valueB *
dtype0

3optimizer/gradients/policy_1/Sum_2_grad/range/startConst*@
_class6
42loc:@optimizer/gradients/policy_1/Sum_2_grad/Shape*
value	B : *
dtype0

3optimizer/gradients/policy_1/Sum_2_grad/range/deltaConst*@
_class6
42loc:@optimizer/gradients/policy_1/Sum_2_grad/Shape*
value	B :*
dtype0

-optimizer/gradients/policy_1/Sum_2_grad/rangeRange3optimizer/gradients/policy_1/Sum_2_grad/range/start,optimizer/gradients/policy_1/Sum_2_grad/Size3optimizer/gradients/policy_1/Sum_2_grad/range/delta*@
_class6
42loc:@optimizer/gradients/policy_1/Sum_2_grad/Shape*

Tidx0

2optimizer/gradients/policy_1/Sum_2_grad/Fill/valueConst*@
_class6
42loc:@optimizer/gradients/policy_1/Sum_2_grad/Shape*
value	B :*
dtype0
ö
,optimizer/gradients/policy_1/Sum_2_grad/FillFill/optimizer/gradients/policy_1/Sum_2_grad/Shape_12optimizer/gradients/policy_1/Sum_2_grad/Fill/value*
T0*@
_class6
42loc:@optimizer/gradients/policy_1/Sum_2_grad/Shape*

index_type0
Ó
5optimizer/gradients/policy_1/Sum_2_grad/DynamicStitchDynamicStitch-optimizer/gradients/policy_1/Sum_2_grad/range+optimizer/gradients/policy_1/Sum_2_grad/mod-optimizer/gradients/policy_1/Sum_2_grad/Shape,optimizer/gradients/policy_1/Sum_2_grad/Fill*
T0*@
_class6
42loc:@optimizer/gradients/policy_1/Sum_2_grad/Shape*
N

1optimizer/gradients/policy_1/Sum_2_grad/Maximum/yConst*@
_class6
42loc:@optimizer/gradients/policy_1/Sum_2_grad/Shape*
value	B :*
dtype0
ļ
/optimizer/gradients/policy_1/Sum_2_grad/MaximumMaximum5optimizer/gradients/policy_1/Sum_2_grad/DynamicStitch1optimizer/gradients/policy_1/Sum_2_grad/Maximum/y*
T0*@
_class6
42loc:@optimizer/gradients/policy_1/Sum_2_grad/Shape
ē
0optimizer/gradients/policy_1/Sum_2_grad/floordivFloorDiv-optimizer/gradients/policy_1/Sum_2_grad/Shape/optimizer/gradients/policy_1/Sum_2_grad/Maximum*
T0*@
_class6
42loc:@optimizer/gradients/policy_1/Sum_2_grad/Shape
Ė
/optimizer/gradients/policy_1/Sum_2_grad/ReshapeReshapeAoptimizer/gradients/optimizer/sub_1_grad/tuple/control_dependency5optimizer/gradients/policy_1/Sum_2_grad/DynamicStitch*
T0*
Tshape0
²
,optimizer/gradients/policy_1/Sum_2_grad/TileTile/optimizer/gradients/policy_1/Sum_2_grad/Reshape0optimizer/gradients/policy_1/Sum_2_grad/floordiv*

Tmultiples0*
T0
o
>optimizer/gradients/optimizer/clip_by_value/Minimum_grad/ShapeShapeoptimizer/sub*
T0*
out_type0
i
@optimizer/gradients/optimizer/clip_by_value/Minimum_grad/Shape_1Const*
valueB *
dtype0
­
@optimizer/gradients/optimizer/clip_by_value/Minimum_grad/Shape_2ShapeIoptimizer/gradients/optimizer/clip_by_value_grad/tuple/control_dependency*
T0*
out_type0
q
Doptimizer/gradients/optimizer/clip_by_value/Minimum_grad/zeros/ConstConst*
valueB
 *    *
dtype0
é
>optimizer/gradients/optimizer/clip_by_value/Minimum_grad/zerosFill@optimizer/gradients/optimizer/clip_by_value/Minimum_grad/Shape_2Doptimizer/gradients/optimizer/clip_by_value/Minimum_grad/zeros/Const*
T0*

index_type0

Boptimizer/gradients/optimizer/clip_by_value/Minimum_grad/LessEqual	LessEqualoptimizer/suboptimizer/PolynomialDecay_1*
T0
ņ
Noptimizer/gradients/optimizer/clip_by_value/Minimum_grad/BroadcastGradientArgsBroadcastGradientArgs>optimizer/gradients/optimizer/clip_by_value/Minimum_grad/Shape@optimizer/gradients/optimizer/clip_by_value/Minimum_grad/Shape_1*
T0
”
?optimizer/gradients/optimizer/clip_by_value/Minimum_grad/SelectSelectBoptimizer/gradients/optimizer/clip_by_value/Minimum_grad/LessEqualIoptimizer/gradients/optimizer/clip_by_value_grad/tuple/control_dependency>optimizer/gradients/optimizer/clip_by_value/Minimum_grad/zeros*
T0
ś
<optimizer/gradients/optimizer/clip_by_value/Minimum_grad/SumSum?optimizer/gradients/optimizer/clip_by_value/Minimum_grad/SelectNoptimizer/gradients/optimizer/clip_by_value/Minimum_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
ą
@optimizer/gradients/optimizer/clip_by_value/Minimum_grad/ReshapeReshape<optimizer/gradients/optimizer/clip_by_value/Minimum_grad/Sum>optimizer/gradients/optimizer/clip_by_value/Minimum_grad/Shape*
T0*
Tshape0
£
Aoptimizer/gradients/optimizer/clip_by_value/Minimum_grad/Select_1SelectBoptimizer/gradients/optimizer/clip_by_value/Minimum_grad/LessEqual>optimizer/gradients/optimizer/clip_by_value/Minimum_grad/zerosIoptimizer/gradients/optimizer/clip_by_value_grad/tuple/control_dependency*
T0

>optimizer/gradients/optimizer/clip_by_value/Minimum_grad/Sum_1SumAoptimizer/gradients/optimizer/clip_by_value/Minimum_grad/Select_1Poptimizer/gradients/optimizer/clip_by_value/Minimum_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
ę
Boptimizer/gradients/optimizer/clip_by_value/Minimum_grad/Reshape_1Reshape>optimizer/gradients/optimizer/clip_by_value/Minimum_grad/Sum_1@optimizer/gradients/optimizer/clip_by_value/Minimum_grad/Shape_1*
T0*
Tshape0
Ł
Ioptimizer/gradients/optimizer/clip_by_value/Minimum_grad/tuple/group_depsNoOpA^optimizer/gradients/optimizer/clip_by_value/Minimum_grad/ReshapeC^optimizer/gradients/optimizer/clip_by_value/Minimum_grad/Reshape_1
É
Qoptimizer/gradients/optimizer/clip_by_value/Minimum_grad/tuple/control_dependencyIdentity@optimizer/gradients/optimizer/clip_by_value/Minimum_grad/ReshapeJ^optimizer/gradients/optimizer/clip_by_value/Minimum_grad/tuple/group_deps*
T0*S
_classI
GEloc:@optimizer/gradients/optimizer/clip_by_value/Minimum_grad/Reshape
Ļ
Soptimizer/gradients/optimizer/clip_by_value/Minimum_grad/tuple/control_dependency_1IdentityBoptimizer/gradients/optimizer/clip_by_value/Minimum_grad/Reshape_1J^optimizer/gradients/optimizer/clip_by_value/Minimum_grad/tuple/group_deps*
T0*U
_classK
IGloc:@optimizer/gradients/optimizer/clip_by_value/Minimum_grad/Reshape_1

1optimizer/gradients/policy_1/stack_1_grad/unstackUnpack,optimizer/gradients/policy_1/Sum_2_grad/Tile*
T0*	
num*

axis
_
,optimizer/gradients/optimizer/sub_grad/ShapeShapeoptimizer/Sum_2*
T0*
out_type0
t
.optimizer/gradients/optimizer/sub_grad/Shape_1Shape"optimizer/extrinsic_value_estimate*
T0*
out_type0
¼
<optimizer/gradients/optimizer/sub_grad/BroadcastGradientArgsBroadcastGradientArgs,optimizer/gradients/optimizer/sub_grad/Shape.optimizer/gradients/optimizer/sub_grad/Shape_1*
T0
č
*optimizer/gradients/optimizer/sub_grad/SumSumQoptimizer/gradients/optimizer/clip_by_value/Minimum_grad/tuple/control_dependency<optimizer/gradients/optimizer/sub_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
Ŗ
.optimizer/gradients/optimizer/sub_grad/ReshapeReshape*optimizer/gradients/optimizer/sub_grad/Sum,optimizer/gradients/optimizer/sub_grad/Shape*
T0*
Tshape0
ģ
,optimizer/gradients/optimizer/sub_grad/Sum_1SumQoptimizer/gradients/optimizer/clip_by_value/Minimum_grad/tuple/control_dependency>optimizer/gradients/optimizer/sub_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
h
*optimizer/gradients/optimizer/sub_grad/NegNeg,optimizer/gradients/optimizer/sub_grad/Sum_1*
T0
®
0optimizer/gradients/optimizer/sub_grad/Reshape_1Reshape*optimizer/gradients/optimizer/sub_grad/Neg.optimizer/gradients/optimizer/sub_grad/Shape_1*
T0*
Tshape0
£
7optimizer/gradients/optimizer/sub_grad/tuple/group_depsNoOp/^optimizer/gradients/optimizer/sub_grad/Reshape1^optimizer/gradients/optimizer/sub_grad/Reshape_1

?optimizer/gradients/optimizer/sub_grad/tuple/control_dependencyIdentity.optimizer/gradients/optimizer/sub_grad/Reshape8^optimizer/gradients/optimizer/sub_grad/tuple/group_deps*
T0*A
_class7
53loc:@optimizer/gradients/optimizer/sub_grad/Reshape

Aoptimizer/gradients/optimizer/sub_grad/tuple/control_dependency_1Identity0optimizer/gradients/optimizer/sub_grad/Reshape_18^optimizer/gradients/optimizer/sub_grad/tuple/group_deps*
T0*C
_class9
75loc:@optimizer/gradients/optimizer/sub_grad/Reshape_1
l
)optimizer/gradients/policy_1/Neg_grad/NegNeg1optimizer/gradients/policy_1/stack_1_grad/unstack*
T0
s
.optimizer/gradients/optimizer/Sum_2_grad/ShapeShape!optimizer/extrinsic_value/BiasAdd*
T0*
out_type0

-optimizer/gradients/optimizer/Sum_2_grad/SizeConst*A
_class7
53loc:@optimizer/gradients/optimizer/Sum_2_grad/Shape*
value	B :*
dtype0
Ń
,optimizer/gradients/optimizer/Sum_2_grad/addAdd!optimizer/Sum_2/reduction_indices-optimizer/gradients/optimizer/Sum_2_grad/Size*
T0*A
_class7
53loc:@optimizer/gradients/optimizer/Sum_2_grad/Shape
į
,optimizer/gradients/optimizer/Sum_2_grad/modFloorMod,optimizer/gradients/optimizer/Sum_2_grad/add-optimizer/gradients/optimizer/Sum_2_grad/Size*
T0*A
_class7
53loc:@optimizer/gradients/optimizer/Sum_2_grad/Shape

0optimizer/gradients/optimizer/Sum_2_grad/Shape_1Const*A
_class7
53loc:@optimizer/gradients/optimizer/Sum_2_grad/Shape*
valueB *
dtype0
”
4optimizer/gradients/optimizer/Sum_2_grad/range/startConst*A
_class7
53loc:@optimizer/gradients/optimizer/Sum_2_grad/Shape*
value	B : *
dtype0
”
4optimizer/gradients/optimizer/Sum_2_grad/range/deltaConst*A
_class7
53loc:@optimizer/gradients/optimizer/Sum_2_grad/Shape*
value	B :*
dtype0
”
.optimizer/gradients/optimizer/Sum_2_grad/rangeRange4optimizer/gradients/optimizer/Sum_2_grad/range/start-optimizer/gradients/optimizer/Sum_2_grad/Size4optimizer/gradients/optimizer/Sum_2_grad/range/delta*A
_class7
53loc:@optimizer/gradients/optimizer/Sum_2_grad/Shape*

Tidx0
 
3optimizer/gradients/optimizer/Sum_2_grad/Fill/valueConst*A
_class7
53loc:@optimizer/gradients/optimizer/Sum_2_grad/Shape*
value	B :*
dtype0
ś
-optimizer/gradients/optimizer/Sum_2_grad/FillFill0optimizer/gradients/optimizer/Sum_2_grad/Shape_13optimizer/gradients/optimizer/Sum_2_grad/Fill/value*
T0*A
_class7
53loc:@optimizer/gradients/optimizer/Sum_2_grad/Shape*

index_type0
Ł
6optimizer/gradients/optimizer/Sum_2_grad/DynamicStitchDynamicStitch.optimizer/gradients/optimizer/Sum_2_grad/range,optimizer/gradients/optimizer/Sum_2_grad/mod.optimizer/gradients/optimizer/Sum_2_grad/Shape-optimizer/gradients/optimizer/Sum_2_grad/Fill*
T0*A
_class7
53loc:@optimizer/gradients/optimizer/Sum_2_grad/Shape*
N

2optimizer/gradients/optimizer/Sum_2_grad/Maximum/yConst*
dtype0*A
_class7
53loc:@optimizer/gradients/optimizer/Sum_2_grad/Shape*
value	B :
ó
0optimizer/gradients/optimizer/Sum_2_grad/MaximumMaximum6optimizer/gradients/optimizer/Sum_2_grad/DynamicStitch2optimizer/gradients/optimizer/Sum_2_grad/Maximum/y*
T0*A
_class7
53loc:@optimizer/gradients/optimizer/Sum_2_grad/Shape
ė
1optimizer/gradients/optimizer/Sum_2_grad/floordivFloorDiv.optimizer/gradients/optimizer/Sum_2_grad/Shape0optimizer/gradients/optimizer/Sum_2_grad/Maximum*
T0*A
_class7
53loc:@optimizer/gradients/optimizer/Sum_2_grad/Shape
Ė
0optimizer/gradients/optimizer/Sum_2_grad/ReshapeReshape?optimizer/gradients/optimizer/sub_grad/tuple/control_dependency6optimizer/gradients/optimizer/Sum_2_grad/DynamicStitch*
T0*
Tshape0
µ
-optimizer/gradients/optimizer/Sum_2_grad/TileTile0optimizer/gradients/optimizer/Sum_2_grad/Reshape1optimizer/gradients/optimizer/Sum_2_grad/floordiv*

Tmultiples0*
T0
„
Uoptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1/Reshape_2_grad/ShapeShape,policy_1/softmax_cross_entropy_with_logits_1*
T0*
out_type0
ū
Woptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1/Reshape_2_grad/ReshapeReshape)optimizer/gradients/policy_1/Neg_grad/NegUoptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1/Reshape_2_grad/Shape*
T0*
Tshape0
Ō
optimizer/gradients/AddN_1AddN-optimizer/gradients/optimizer/Sum_3_grad/Tile-optimizer/gradients/optimizer/Sum_2_grad/Tile*
T0*@
_class6
42loc:@optimizer/gradients/optimizer/Sum_3_grad/Tile*
N

Foptimizer/gradients/optimizer/extrinsic_value/BiasAdd_grad/BiasAddGradBiasAddGradoptimizer/gradients/AddN_1*
T0*
data_formatNHWC
¹
Koptimizer/gradients/optimizer/extrinsic_value/BiasAdd_grad/tuple/group_depsNoOp^optimizer/gradients/AddN_1G^optimizer/gradients/optimizer/extrinsic_value/BiasAdd_grad/BiasAddGrad

Soptimizer/gradients/optimizer/extrinsic_value/BiasAdd_grad/tuple/control_dependencyIdentityoptimizer/gradients/AddN_1L^optimizer/gradients/optimizer/extrinsic_value/BiasAdd_grad/tuple/group_deps*
T0*@
_class6
42loc:@optimizer/gradients/optimizer/Sum_3_grad/Tile
Ū
Uoptimizer/gradients/optimizer/extrinsic_value/BiasAdd_grad/tuple/control_dependency_1IdentityFoptimizer/gradients/optimizer/extrinsic_value/BiasAdd_grad/BiasAddGradL^optimizer/gradients/optimizer/extrinsic_value/BiasAdd_grad/tuple/group_deps*
T0*Y
_classO
MKloc:@optimizer/gradients/optimizer/extrinsic_value/BiasAdd_grad/BiasAddGrad
f
 optimizer/gradients/zeros_like_4	ZerosLike.policy_1/softmax_cross_entropy_with_logits_1:1*
T0

Toptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims/dimConst*
valueB :
’’’’’’’’’*
dtype0
¢
Poptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims
ExpandDimsWoptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1/Reshape_2_grad/ReshapeToptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims/dim*

Tdim0*
T0
Ū
Ioptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1_grad/mulMulPoptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims.policy_1/softmax_cross_entropy_with_logits_1:1*
T0

Poptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1_grad/LogSoftmax
LogSoftmax4policy_1/softmax_cross_entropy_with_logits_1/Reshape*
T0
«
Ioptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1_grad/NegNegPoptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1_grad/LogSoftmax*
T0

Voptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims_1/dimConst*
valueB :
’’’’’’’’’*
dtype0
¦
Roptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims_1
ExpandDimsWoptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1/Reshape_2_grad/ReshapeVoptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims_1/dim*

Tdim0*
T0
ś
Koptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1_grad/mul_1MulRoptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims_1Ioptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1_grad/Neg*
T0
ų
Voptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1_grad/tuple/group_depsNoOpJ^optimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1_grad/mulL^optimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1_grad/mul_1
õ
^optimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1_grad/tuple/control_dependencyIdentityIoptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1_grad/mulW^optimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1_grad/tuple/group_deps*
T0*\
_classR
PNloc:@optimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1_grad/mul
ū
`optimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1_grad/tuple/control_dependency_1IdentityKoptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1_grad/mul_1W^optimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1_grad/tuple/group_deps*
T0*^
_classT
RPloc:@optimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1_grad/mul_1
ö
@optimizer/gradients/optimizer/extrinsic_value/MatMul_grad/MatMulMatMulSoptimizer/gradients/optimizer/extrinsic_value/BiasAdd_grad/tuple/control_dependency&optimizer//extrinsic_value/kernel/read*
transpose_a( *
transpose_b(*
T0
ā
Boptimizer/gradients/optimizer/extrinsic_value/MatMul_grad/MatMul_1MatMuloptimizer/concatSoptimizer/gradients/optimizer/extrinsic_value/BiasAdd_grad/tuple/control_dependency*
T0*
transpose_a(*
transpose_b( 
Ś
Joptimizer/gradients/optimizer/extrinsic_value/MatMul_grad/tuple/group_depsNoOpA^optimizer/gradients/optimizer/extrinsic_value/MatMul_grad/MatMulC^optimizer/gradients/optimizer/extrinsic_value/MatMul_grad/MatMul_1
Ė
Roptimizer/gradients/optimizer/extrinsic_value/MatMul_grad/tuple/control_dependencyIdentity@optimizer/gradients/optimizer/extrinsic_value/MatMul_grad/MatMulK^optimizer/gradients/optimizer/extrinsic_value/MatMul_grad/tuple/group_deps*
T0*S
_classI
GEloc:@optimizer/gradients/optimizer/extrinsic_value/MatMul_grad/MatMul
Ń
Toptimizer/gradients/optimizer/extrinsic_value/MatMul_grad/tuple/control_dependency_1IdentityBoptimizer/gradients/optimizer/extrinsic_value/MatMul_grad/MatMul_1K^optimizer/gradients/optimizer/extrinsic_value/MatMul_grad/tuple/group_deps*
T0*U
_classK
IGloc:@optimizer/gradients/optimizer/extrinsic_value/MatMul_grad/MatMul_1

Soptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1/Reshape_grad/ShapeShapepolicy_1/strided_slice_5*
T0*
out_type0
¬
Uoptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1/Reshape_grad/ReshapeReshape^optimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1_grad/tuple/control_dependencySoptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1/Reshape_grad/Shape*
T0*
Tshape0
l
7optimizer/gradients/policy_1/strided_slice_5_grad/ShapeShapepolicy_1/concat_2*
T0*
out_type0
Ä
Boptimizer/gradients/policy_1/strided_slice_5_grad/StridedSliceGradStridedSliceGrad7optimizer/gradients/policy_1/strided_slice_5_grad/Shapepolicy_1/strided_slice_5/stack policy_1/strided_slice_5/stack_1 policy_1/strided_slice_5/stack_2Uoptimizer/gradients/policy_1/softmax_cross_entropy_with_logits_1/Reshape_grad/Reshape*
T0*
Index0*
shrink_axis_mask *
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask
ē
ooptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/ShapeShapeToptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd*
T0*
out_type0
é
qoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Shape_1ShapeToptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Sigmoid*
T0*
out_type0

optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsooptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Shapeqoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Shape_1*
T0
§
moptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/MulMulRoptimizer/gradients/optimizer/extrinsic_value/MatMul_grad/tuple/control_dependencyToptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Sigmoid*
T0

moptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/SumSummoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Muloptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
ó
qoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/ReshapeReshapemoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Sumooptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Shape*
T0*
Tshape0
©
ooptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Mul_1MulToptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAddRoptimizer/gradients/optimizer/extrinsic_value/MatMul_grad/tuple/control_dependency*
T0

ooptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Sum_1Sumooptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Mul_1optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
ł
soptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape_1Reshapeooptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Sum_1qoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Shape_1*
T0*
Tshape0
ģ
zoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/tuple/group_depsNoOpr^optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshapet^optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape_1

optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/tuple/control_dependencyIdentityqoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape{^optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/tuple/group_deps*
T0*
_classz
xvloc:@optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape

optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/tuple/control_dependency_1Identitysoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape_1{^optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/tuple/group_deps*
T0*
_class|
zxloc:@optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape_1
×
optimizer/gradients/AddN_2AddNBoptimizer/gradients/policy_1/strided_slice_3_grad/StridedSliceGradBoptimizer/gradients/policy_1/strided_slice_2_grad/StridedSliceGradBoptimizer/gradients/policy_1/strided_slice_5_grad/StridedSliceGrad*
T0*U
_classK
IGloc:@optimizer/gradients/policy_1/strided_slice_3_grad/StridedSliceGrad*
N
ī
yoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Sigmoid_grad/SigmoidGradSigmoidGradToptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Sigmoidoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/tuple/control_dependency_1*
T0
v
2optimizer/gradients/policy_1/Log_1_grad/Reciprocal
Reciprocalpolicy_1/add_2^optimizer/gradients/AddN_2*
T0

+optimizer/gradients/policy_1/Log_1_grad/mulMuloptimizer/gradients/AddN_22optimizer/gradients/policy_1/Log_1_grad/Reciprocal*
T0
»
optimizer/gradients/AddN_3AddNoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/tuple/control_dependencyyoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Sigmoid_grad/SigmoidGrad*
T0*
_classz
xvloc:@optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape*
N
Ä
yoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/BiasAddGradBiasAddGradoptimizer/gradients/AddN_3*
T0*
data_formatNHWC

~optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/group_depsNoOp^optimizer/gradients/AddN_3z^optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/BiasAddGrad
Ą
optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/control_dependencyIdentityoptimizer/gradients/AddN_3^optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*
_classz
xvloc:@optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape
«
optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/control_dependency_1Identityyoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/BiasAddGrad^optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*
_class
~loc:@optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/BiasAddGrad
a
-optimizer/gradients/policy_1/add_2_grad/ShapeShapepolicy_1/truediv*
T0*
out_type0
X
/optimizer/gradients/policy_1/add_2_grad/Shape_1Const*
valueB *
dtype0
æ
=optimizer/gradients/policy_1/add_2_grad/BroadcastGradientArgsBroadcastGradientArgs-optimizer/gradients/policy_1/add_2_grad/Shape/optimizer/gradients/policy_1/add_2_grad/Shape_1*
T0
Ä
+optimizer/gradients/policy_1/add_2_grad/SumSum+optimizer/gradients/policy_1/Log_1_grad/mul=optimizer/gradients/policy_1/add_2_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
­
/optimizer/gradients/policy_1/add_2_grad/ReshapeReshape+optimizer/gradients/policy_1/add_2_grad/Sum-optimizer/gradients/policy_1/add_2_grad/Shape*
T0*
Tshape0
Č
-optimizer/gradients/policy_1/add_2_grad/Sum_1Sum+optimizer/gradients/policy_1/Log_1_grad/mul?optimizer/gradients/policy_1/add_2_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
³
1optimizer/gradients/policy_1/add_2_grad/Reshape_1Reshape-optimizer/gradients/policy_1/add_2_grad/Sum_1/optimizer/gradients/policy_1/add_2_grad/Shape_1*
T0*
Tshape0
¦
8optimizer/gradients/policy_1/add_2_grad/tuple/group_depsNoOp0^optimizer/gradients/policy_1/add_2_grad/Reshape2^optimizer/gradients/policy_1/add_2_grad/Reshape_1

@optimizer/gradients/policy_1/add_2_grad/tuple/control_dependencyIdentity/optimizer/gradients/policy_1/add_2_grad/Reshape9^optimizer/gradients/policy_1/add_2_grad/tuple/group_deps*
T0*B
_class8
64loc:@optimizer/gradients/policy_1/add_2_grad/Reshape

Boptimizer/gradients/policy_1/add_2_grad/tuple/control_dependency_1Identity1optimizer/gradients/policy_1/add_2_grad/Reshape_19^optimizer/gradients/policy_1/add_2_grad/tuple/group_deps*
T0*D
_class:
86loc:@optimizer/gradients/policy_1/add_2_grad/Reshape_1

soptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMulMatMuloptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/control_dependencyYoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/read*
T0*
transpose_a( *
transpose_b(

uoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMul_1MatMulPoptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Muloptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/control_dependency*
transpose_a(*
transpose_b( *
T0
ó
}optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/group_depsNoOpt^optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMulv^optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMul_1

optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/control_dependencyIdentitysoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMul~^optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/group_deps*
T0*
_class|
zxloc:@optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMul

optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/control_dependency_1Identityuoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMul_1~^optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/group_deps*
T0*
_class~
|zloc:@optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMul_1
_
/optimizer/gradients/policy_1/truediv_grad/ShapeShapepolicy_1/Mul*
T0*
out_type0
a
1optimizer/gradients/policy_1/truediv_grad/Shape_1Shapepolicy_1/Sum*
T0*
out_type0
Å
?optimizer/gradients/policy_1/truediv_grad/BroadcastGradientArgsBroadcastGradientArgs/optimizer/gradients/policy_1/truediv_grad/Shape1optimizer/gradients/policy_1/truediv_grad/Shape_1*
T0

1optimizer/gradients/policy_1/truediv_grad/RealDivRealDiv@optimizer/gradients/policy_1/add_2_grad/tuple/control_dependencypolicy_1/Sum*
T0
Ī
-optimizer/gradients/policy_1/truediv_grad/SumSum1optimizer/gradients/policy_1/truediv_grad/RealDiv?optimizer/gradients/policy_1/truediv_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
³
1optimizer/gradients/policy_1/truediv_grad/ReshapeReshape-optimizer/gradients/policy_1/truediv_grad/Sum/optimizer/gradients/policy_1/truediv_grad/Shape*
T0*
Tshape0
K
-optimizer/gradients/policy_1/truediv_grad/NegNegpolicy_1/Mul*
T0

3optimizer/gradients/policy_1/truediv_grad/RealDiv_1RealDiv-optimizer/gradients/policy_1/truediv_grad/Negpolicy_1/Sum*
T0

3optimizer/gradients/policy_1/truediv_grad/RealDiv_2RealDiv3optimizer/gradients/policy_1/truediv_grad/RealDiv_1policy_1/Sum*
T0
“
-optimizer/gradients/policy_1/truediv_grad/mulMul@optimizer/gradients/policy_1/add_2_grad/tuple/control_dependency3optimizer/gradients/policy_1/truediv_grad/RealDiv_2*
T0
Ī
/optimizer/gradients/policy_1/truediv_grad/Sum_1Sum-optimizer/gradients/policy_1/truediv_grad/mulAoptimizer/gradients/policy_1/truediv_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
¹
3optimizer/gradients/policy_1/truediv_grad/Reshape_1Reshape/optimizer/gradients/policy_1/truediv_grad/Sum_11optimizer/gradients/policy_1/truediv_grad/Shape_1*
T0*
Tshape0
¬
:optimizer/gradients/policy_1/truediv_grad/tuple/group_depsNoOp2^optimizer/gradients/policy_1/truediv_grad/Reshape4^optimizer/gradients/policy_1/truediv_grad/Reshape_1

Boptimizer/gradients/policy_1/truediv_grad/tuple/control_dependencyIdentity1optimizer/gradients/policy_1/truediv_grad/Reshape;^optimizer/gradients/policy_1/truediv_grad/tuple/group_deps*
T0*D
_class:
86loc:@optimizer/gradients/policy_1/truediv_grad/Reshape

Doptimizer/gradients/policy_1/truediv_grad/tuple/control_dependency_1Identity3optimizer/gradients/policy_1/truediv_grad/Reshape_1;^optimizer/gradients/policy_1/truediv_grad/tuple/group_deps*
T0*F
_class<
:8loc:@optimizer/gradients/policy_1/truediv_grad/Reshape_1
ē
ooptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/ShapeShapeToptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd*
T0*
out_type0
é
qoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Shape_1ShapeToptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Sigmoid*
T0*
out_type0

optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsooptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Shapeqoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Shape_1*
T0
Ū
moptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/MulMuloptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/control_dependencyToptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Sigmoid*
T0

moptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/SumSummoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Muloptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
ó
qoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/ReshapeReshapemoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Sumooptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Shape*
T0*
Tshape0
Ż
ooptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Mul_1MulToptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAddoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/control_dependency*
T0

ooptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Sum_1Sumooptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Mul_1optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
ł
soptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape_1Reshapeooptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Sum_1qoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Shape_1*
T0*
Tshape0
ģ
zoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/tuple/group_depsNoOpr^optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshapet^optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape_1

optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/tuple/control_dependencyIdentityqoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape{^optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/tuple/group_deps*
T0*
_classz
xvloc:@optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape

optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/tuple/control_dependency_1Identitysoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape_1{^optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/tuple/group_deps*
T0*
_class|
zxloc:@optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape_1
[
+optimizer/gradients/policy_1/Sum_grad/ShapeShapepolicy_1/Mul*
T0*
out_type0

*optimizer/gradients/policy_1/Sum_grad/SizeConst*>
_class4
20loc:@optimizer/gradients/policy_1/Sum_grad/Shape*
value	B :*
dtype0
Å
)optimizer/gradients/policy_1/Sum_grad/addAddpolicy_1/Sum/reduction_indices*optimizer/gradients/policy_1/Sum_grad/Size*
T0*>
_class4
20loc:@optimizer/gradients/policy_1/Sum_grad/Shape
Õ
)optimizer/gradients/policy_1/Sum_grad/modFloorMod)optimizer/gradients/policy_1/Sum_grad/add*optimizer/gradients/policy_1/Sum_grad/Size*
T0*>
_class4
20loc:@optimizer/gradients/policy_1/Sum_grad/Shape

-optimizer/gradients/policy_1/Sum_grad/Shape_1Const*>
_class4
20loc:@optimizer/gradients/policy_1/Sum_grad/Shape*
valueB *
dtype0

1optimizer/gradients/policy_1/Sum_grad/range/startConst*>
_class4
20loc:@optimizer/gradients/policy_1/Sum_grad/Shape*
value	B : *
dtype0

1optimizer/gradients/policy_1/Sum_grad/range/deltaConst*>
_class4
20loc:@optimizer/gradients/policy_1/Sum_grad/Shape*
value	B :*
dtype0

+optimizer/gradients/policy_1/Sum_grad/rangeRange1optimizer/gradients/policy_1/Sum_grad/range/start*optimizer/gradients/policy_1/Sum_grad/Size1optimizer/gradients/policy_1/Sum_grad/range/delta*

Tidx0*>
_class4
20loc:@optimizer/gradients/policy_1/Sum_grad/Shape

0optimizer/gradients/policy_1/Sum_grad/Fill/valueConst*>
_class4
20loc:@optimizer/gradients/policy_1/Sum_grad/Shape*
value	B :*
dtype0
ī
*optimizer/gradients/policy_1/Sum_grad/FillFill-optimizer/gradients/policy_1/Sum_grad/Shape_10optimizer/gradients/policy_1/Sum_grad/Fill/value*
T0*>
_class4
20loc:@optimizer/gradients/policy_1/Sum_grad/Shape*

index_type0
Ē
3optimizer/gradients/policy_1/Sum_grad/DynamicStitchDynamicStitch+optimizer/gradients/policy_1/Sum_grad/range)optimizer/gradients/policy_1/Sum_grad/mod+optimizer/gradients/policy_1/Sum_grad/Shape*optimizer/gradients/policy_1/Sum_grad/Fill*>
_class4
20loc:@optimizer/gradients/policy_1/Sum_grad/Shape*
N*
T0

/optimizer/gradients/policy_1/Sum_grad/Maximum/yConst*>
_class4
20loc:@optimizer/gradients/policy_1/Sum_grad/Shape*
value	B :*
dtype0
ē
-optimizer/gradients/policy_1/Sum_grad/MaximumMaximum3optimizer/gradients/policy_1/Sum_grad/DynamicStitch/optimizer/gradients/policy_1/Sum_grad/Maximum/y*
T0*>
_class4
20loc:@optimizer/gradients/policy_1/Sum_grad/Shape
ß
.optimizer/gradients/policy_1/Sum_grad/floordivFloorDiv+optimizer/gradients/policy_1/Sum_grad/Shape-optimizer/gradients/policy_1/Sum_grad/Maximum*
T0*>
_class4
20loc:@optimizer/gradients/policy_1/Sum_grad/Shape
Ź
-optimizer/gradients/policy_1/Sum_grad/ReshapeReshapeDoptimizer/gradients/policy_1/truediv_grad/tuple/control_dependency_13optimizer/gradients/policy_1/Sum_grad/DynamicStitch*
T0*
Tshape0
¬
*optimizer/gradients/policy_1/Sum_grad/TileTile-optimizer/gradients/policy_1/Sum_grad/Reshape.optimizer/gradients/policy_1/Sum_grad/floordiv*

Tmultiples0*
T0
ī
yoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Sigmoid_grad/SigmoidGradSigmoidGradToptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Sigmoidoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/tuple/control_dependency_1*
T0
ź
optimizer/gradients/AddN_4AddNBoptimizer/gradients/policy_1/truediv_grad/tuple/control_dependency*optimizer/gradients/policy_1/Sum_grad/Tile*
N*
T0*D
_class:
86loc:@optimizer/gradients/policy_1/truediv_grad/Reshape
[
+optimizer/gradients/policy_1/Mul_grad/ShapeShapepolicy_1/add*
T0*
out_type0
g
-optimizer/gradients/policy_1/Mul_grad/Shape_1Shapepolicy_1/strided_slice*
T0*
out_type0
¹
;optimizer/gradients/policy_1/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs+optimizer/gradients/policy_1/Mul_grad/Shape-optimizer/gradients/policy_1/Mul_grad/Shape_1*
T0
m
)optimizer/gradients/policy_1/Mul_grad/MulMuloptimizer/gradients/AddN_4policy_1/strided_slice*
T0
¾
)optimizer/gradients/policy_1/Mul_grad/SumSum)optimizer/gradients/policy_1/Mul_grad/Mul;optimizer/gradients/policy_1/Mul_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
§
-optimizer/gradients/policy_1/Mul_grad/ReshapeReshape)optimizer/gradients/policy_1/Mul_grad/Sum+optimizer/gradients/policy_1/Mul_grad/Shape*
T0*
Tshape0
e
+optimizer/gradients/policy_1/Mul_grad/Mul_1Mulpolicy_1/addoptimizer/gradients/AddN_4*
T0
Ä
+optimizer/gradients/policy_1/Mul_grad/Sum_1Sum+optimizer/gradients/policy_1/Mul_grad/Mul_1=optimizer/gradients/policy_1/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
­
/optimizer/gradients/policy_1/Mul_grad/Reshape_1Reshape+optimizer/gradients/policy_1/Mul_grad/Sum_1-optimizer/gradients/policy_1/Mul_grad/Shape_1*
T0*
Tshape0
 
6optimizer/gradients/policy_1/Mul_grad/tuple/group_depsNoOp.^optimizer/gradients/policy_1/Mul_grad/Reshape0^optimizer/gradients/policy_1/Mul_grad/Reshape_1
ż
>optimizer/gradients/policy_1/Mul_grad/tuple/control_dependencyIdentity-optimizer/gradients/policy_1/Mul_grad/Reshape7^optimizer/gradients/policy_1/Mul_grad/tuple/group_deps*
T0*@
_class6
42loc:@optimizer/gradients/policy_1/Mul_grad/Reshape

@optimizer/gradients/policy_1/Mul_grad/tuple/control_dependency_1Identity/optimizer/gradients/policy_1/Mul_grad/Reshape_17^optimizer/gradients/policy_1/Mul_grad/tuple/group_deps*
T0*B
_class8
64loc:@optimizer/gradients/policy_1/Mul_grad/Reshape_1
»
optimizer/gradients/AddN_5AddNoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/tuple/control_dependencyyoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Sigmoid_grad/SigmoidGrad*
T0*
_classz
xvloc:@optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape*
N
Ä
yoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/BiasAddGradBiasAddGradoptimizer/gradients/AddN_5*
T0*
data_formatNHWC

~optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/group_depsNoOp^optimizer/gradients/AddN_5z^optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/BiasAddGrad
Ą
optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/control_dependencyIdentityoptimizer/gradients/AddN_5^optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*
_classz
xvloc:@optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape
«
optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/control_dependency_1Identityyoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/BiasAddGrad^optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*
_class
~loc:@optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/BiasAddGrad
_
+optimizer/gradients/policy_1/add_grad/ShapeShapepolicy_1/Softmax*
T0*
out_type0
V
-optimizer/gradients/policy_1/add_grad/Shape_1Const*
valueB *
dtype0
¹
;optimizer/gradients/policy_1/add_grad/BroadcastGradientArgsBroadcastGradientArgs+optimizer/gradients/policy_1/add_grad/Shape-optimizer/gradients/policy_1/add_grad/Shape_1*
T0
Ó
)optimizer/gradients/policy_1/add_grad/SumSum>optimizer/gradients/policy_1/Mul_grad/tuple/control_dependency;optimizer/gradients/policy_1/add_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
§
-optimizer/gradients/policy_1/add_grad/ReshapeReshape)optimizer/gradients/policy_1/add_grad/Sum+optimizer/gradients/policy_1/add_grad/Shape*
T0*
Tshape0
×
+optimizer/gradients/policy_1/add_grad/Sum_1Sum>optimizer/gradients/policy_1/Mul_grad/tuple/control_dependency=optimizer/gradients/policy_1/add_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
­
/optimizer/gradients/policy_1/add_grad/Reshape_1Reshape+optimizer/gradients/policy_1/add_grad/Sum_1-optimizer/gradients/policy_1/add_grad/Shape_1*
T0*
Tshape0
 
6optimizer/gradients/policy_1/add_grad/tuple/group_depsNoOp.^optimizer/gradients/policy_1/add_grad/Reshape0^optimizer/gradients/policy_1/add_grad/Reshape_1
ż
>optimizer/gradients/policy_1/add_grad/tuple/control_dependencyIdentity-optimizer/gradients/policy_1/add_grad/Reshape7^optimizer/gradients/policy_1/add_grad/tuple/group_deps*
T0*@
_class6
42loc:@optimizer/gradients/policy_1/add_grad/Reshape

@optimizer/gradients/policy_1/add_grad/tuple/control_dependency_1Identity/optimizer/gradients/policy_1/add_grad/Reshape_17^optimizer/gradients/policy_1/add_grad/tuple/group_deps*
T0*B
_class8
64loc:@optimizer/gradients/policy_1/add_grad/Reshape_1

soptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMulMatMuloptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/control_dependencyYoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/read*
transpose_a( *
transpose_b(*
T0
č
uoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMul_1MatMul/optimizer/main_graph_0_encoder0/flatten/Reshapeoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/control_dependency*
T0*
transpose_a(*
transpose_b( 
ó
}optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/tuple/group_depsNoOpt^optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMulv^optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMul_1

optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/tuple/control_dependencyIdentitysoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMul~^optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/tuple/group_deps*
_class|
zxloc:@optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMul*
T0

optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/tuple/control_dependency_1Identityuoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMul_1~^optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/tuple/group_deps*
T0*
_class~
|zloc:@optimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMul_1

-optimizer/gradients/policy_1/Softmax_grad/mulMul>optimizer/gradients/policy_1/add_grad/tuple/control_dependencypolicy_1/Softmax*
T0
r
?optimizer/gradients/policy_1/Softmax_grad/Sum/reduction_indicesConst*
valueB :
’’’’’’’’’*
dtype0
Ź
-optimizer/gradients/policy_1/Softmax_grad/SumSum-optimizer/gradients/policy_1/Softmax_grad/mul?optimizer/gradients/policy_1/Softmax_grad/Sum/reduction_indices*

Tidx0*
	keep_dims(*
T0
¬
-optimizer/gradients/policy_1/Softmax_grad/subSub>optimizer/gradients/policy_1/add_grad/tuple/control_dependency-optimizer/gradients/policy_1/Softmax_grad/Sum*
T0

/optimizer/gradients/policy_1/Softmax_grad/mul_1Mul-optimizer/gradients/policy_1/Softmax_grad/subpolicy_1/Softmax*
T0

Noptimizer/gradients/optimizer/main_graph_0_encoder0/flatten/Reshape_grad/ShapeShape*optimizer/main_graph_0_encoder0/conv_2/Elu*
T0*
out_type0
Ź
Poptimizer/gradients/optimizer/main_graph_0_encoder0/flatten/Reshape_grad/ReshapeReshapeoptimizer/gradients/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/tuple/control_dependencyNoptimizer/gradients/optimizer/main_graph_0_encoder0/flatten/Reshape_grad/Shape*
T0*
Tshape0
¹
5optimizer/gradients/policy_1/dense/MatMul_grad/MatMulMatMul/optimizer/gradients/policy_1/Softmax_grad/mul_1policy/dense/kernel/read*
T0*
transpose_a( *
transpose_b(
°
7optimizer/gradients/policy_1/dense/MatMul_grad/MatMul_1MatMulpolicy/concat/optimizer/gradients/policy_1/Softmax_grad/mul_1*
T0*
transpose_a(*
transpose_b( 
¹
?optimizer/gradients/policy_1/dense/MatMul_grad/tuple/group_depsNoOp6^optimizer/gradients/policy_1/dense/MatMul_grad/MatMul8^optimizer/gradients/policy_1/dense/MatMul_grad/MatMul_1

Goptimizer/gradients/policy_1/dense/MatMul_grad/tuple/control_dependencyIdentity5optimizer/gradients/policy_1/dense/MatMul_grad/MatMul@^optimizer/gradients/policy_1/dense/MatMul_grad/tuple/group_deps*
T0*H
_class>
<:loc:@optimizer/gradients/policy_1/dense/MatMul_grad/MatMul
„
Ioptimizer/gradients/policy_1/dense/MatMul_grad/tuple/control_dependency_1Identity7optimizer/gradients/policy_1/dense/MatMul_grad/MatMul_1@^optimizer/gradients/policy_1/dense/MatMul_grad/tuple/group_deps*
T0*J
_class@
><loc:@optimizer/gradients/policy_1/dense/MatMul_grad/MatMul_1
Ż
Koptimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/Elu_grad/EluGradEluGradPoptimizer/gradients/optimizer/main_graph_0_encoder0/flatten/Reshape_grad/Reshape*optimizer/main_graph_0_encoder0/conv_2/Elu*
T0
Ļ
Soptimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/BiasAdd_grad/BiasAddGradBiasAddGradKoptimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/Elu_grad/EluGrad*
T0*
data_formatNHWC

Xoptimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/group_depsNoOpT^optimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/BiasAdd_grad/BiasAddGradL^optimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/Elu_grad/EluGrad
ż
`optimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/control_dependencyIdentityKoptimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/Elu_grad/EluGradY^optimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/group_deps*
T0*^
_classT
RPloc:@optimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/Elu_grad/EluGrad

boptimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/control_dependency_1IdentitySoptimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/BiasAdd_grad/BiasAddGradY^optimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/group_deps*
T0*f
_class\
ZXloc:@optimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/BiasAdd_grad/BiasAddGrad
į
loptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/ShapeShapeQpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd*
T0*
out_type0
ć
noptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Shape_1ShapeQpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Sigmoid*
T0*
out_type0
ü
|optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsloptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Shapenoptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Shape_1*
T0

joptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/MulMulGoptimizer/gradients/policy_1/dense/MatMul_grad/tuple/control_dependencyQpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Sigmoid*
T0

joptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/SumSumjoptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Mul|optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
ź
noptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/ReshapeReshapejoptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Sumloptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Shape*
Tshape0*
T0

loptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Mul_1MulQpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAddGoptimizer/gradients/policy_1/dense/MatMul_grad/tuple/control_dependency*
T0

loptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Sum_1Sumloptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Mul_1~optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
š
poptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape_1Reshapeloptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Sum_1noptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Shape_1*
T0*
Tshape0
ć
woptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/tuple/group_depsNoOpo^optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshapeq^optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape_1

optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/tuple/control_dependencyIdentitynoptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshapex^optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/tuple/group_deps*
T0*
_classw
usloc:@optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape

optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/tuple/control_dependency_1Identitypoptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape_1x^optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/tuple/group_deps*
T0*
_classy
wuloc:@optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape_1
Ś
Moptimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/ShapeNShapeN*optimizer/main_graph_0_encoder0/conv_1/Elu3optimizer//main_graph_0_encoder0/conv_2/kernel/read*
T0*
out_type0*
N
č
Zoptimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropInputConv2DBackpropInputMoptimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/ShapeN3optimizer//main_graph_0_encoder0/conv_2/kernel/read`optimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/control_dependency*
	dilations
*
T0*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
explicit_paddings
 *
paddingVALID
ć
[optimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropFilterConv2DBackpropFilter*optimizer/main_graph_0_encoder0/conv_1/EluOoptimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/ShapeN:1`optimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/control_dependency*
	dilations
*
T0*
strides
*
data_formatNHWC*
use_cudnn_on_gpu(*
explicit_paddings
 *
paddingVALID

Woptimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/tuple/group_depsNoOp\^optimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropFilter[^optimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropInput

_optimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/tuple/control_dependencyIdentityZoptimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropInputX^optimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/tuple/group_deps*
T0*m
_classc
a_loc:@optimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropInput

aoptimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/tuple/control_dependency_1Identity[optimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropFilterX^optimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/tuple/group_deps*
T0*n
_classd
b`loc:@optimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropFilter
å
voptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Sigmoid_grad/SigmoidGradSigmoidGradQpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Sigmoidoptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/tuple/control_dependency_1*
T0
ģ
Koptimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/Elu_grad/EluGradEluGrad_optimizer/gradients/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/tuple/control_dependency*optimizer/main_graph_0_encoder0/conv_1/Elu*
T0
±
optimizer/gradients/AddN_6AddNoptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/tuple/control_dependencyvoptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Sigmoid_grad/SigmoidGrad*
T0*
_classw
usloc:@optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape*
N
Į
voptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/BiasAddGradBiasAddGradoptimizer/gradients/AddN_6*
T0*
data_formatNHWC

{optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/group_depsNoOp^optimizer/gradients/AddN_6w^optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/BiasAddGrad
·
optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/control_dependencyIdentityoptimizer/gradients/AddN_6|^optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*
_classw
usloc:@optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape

optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/control_dependency_1Identityvoptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/BiasAddGrad|^optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*
_class
}{loc:@optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/BiasAddGrad
Ļ
Soptimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/BiasAdd_grad/BiasAddGradBiasAddGradKoptimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/Elu_grad/EluGrad*
T0*
data_formatNHWC

Xoptimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/group_depsNoOpT^optimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/BiasAdd_grad/BiasAddGradL^optimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/Elu_grad/EluGrad
ż
`optimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/control_dependencyIdentityKoptimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/Elu_grad/EluGradY^optimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/group_deps*
T0*^
_classT
RPloc:@optimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/Elu_grad/EluGrad

boptimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/control_dependency_1IdentitySoptimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/BiasAdd_grad/BiasAddGradY^optimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/group_deps*
T0*f
_class\
ZXloc:@optimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/BiasAdd_grad/BiasAddGrad

poptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMulMatMuloptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/control_dependencyUpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/read*
transpose_a( *
transpose_b(*
T0

roptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMul_1MatMulMpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Muloptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
ź
zoptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/group_depsNoOpq^optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMuls^optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMul_1

optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/control_dependencyIdentitypoptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMul{^optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/group_deps*
T0*
_classy
wuloc:@optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMul

optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/control_dependency_1Identityroptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMul_1{^optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/group_deps*
T0*
_class{
ywloc:@optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMul_1
Ä
Moptimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/ShapeNShapeNvisual_observation_03optimizer//main_graph_0_encoder0/conv_1/kernel/read*
T0*
out_type0*
N
č
Zoptimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropInputConv2DBackpropInputMoptimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/ShapeN3optimizer//main_graph_0_encoder0/conv_1/kernel/read`optimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/control_dependency*
	dilations
*
T0*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
explicit_paddings
 *
paddingVALID
Ķ
[optimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropFilterConv2DBackpropFiltervisual_observation_0Ooptimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/ShapeN:1`optimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/control_dependency*
	dilations
*
T0*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
explicit_paddings
 *
paddingVALID

Woptimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/tuple/group_depsNoOp\^optimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropFilter[^optimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropInput

_optimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/tuple/control_dependencyIdentityZoptimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropInputX^optimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/tuple/group_deps*
T0*m
_classc
a_loc:@optimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropInput

aoptimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/tuple/control_dependency_1Identity[optimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropFilterX^optimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/tuple/group_deps*
T0*n
_classd
b`loc:@optimizer/gradients/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropFilter
į
loptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/ShapeShapeQpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd*
T0*
out_type0
ć
noptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Shape_1ShapeQpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Sigmoid*
T0*
out_type0
ü
|optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsloptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Shapenoptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Shape_1*
T0
Ņ
joptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/MulMuloptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/control_dependencyQpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Sigmoid*
T0

joptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/SumSumjoptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Mul|optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
ź
noptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/ReshapeReshapejoptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Sumloptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Shape*
Tshape0*
T0
Ō
loptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Mul_1MulQpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAddoptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/control_dependency*
T0

loptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Sum_1Sumloptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Mul_1~optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
š
poptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape_1Reshapeloptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Sum_1noptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Shape_1*
T0*
Tshape0
ć
woptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/tuple/group_depsNoOpo^optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshapeq^optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape_1

optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/tuple/control_dependencyIdentitynoptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshapex^optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/tuple/group_deps*
T0*
_classw
usloc:@optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape

optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/tuple/control_dependency_1Identitypoptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape_1x^optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/tuple/group_deps*
T0*
_classy
wuloc:@optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape_1
å
voptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Sigmoid_grad/SigmoidGradSigmoidGradQpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Sigmoidoptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/tuple/control_dependency_1*
T0
±
optimizer/gradients/AddN_7AddNoptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/tuple/control_dependencyvoptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Sigmoid_grad/SigmoidGrad*
T0*
_classw
usloc:@optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape*
N
Į
voptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/BiasAddGradBiasAddGradoptimizer/gradients/AddN_7*
T0*
data_formatNHWC

{optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/group_depsNoOp^optimizer/gradients/AddN_7w^optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/BiasAddGrad
·
optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/control_dependencyIdentityoptimizer/gradients/AddN_7|^optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*
_classw
usloc:@optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape

optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/control_dependency_1Identityvoptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/BiasAddGrad|^optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*
_class
}{loc:@optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/BiasAddGrad

poptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMulMatMuloptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/control_dependencyUpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/read*
T0*
transpose_a( *
transpose_b(
ß
roptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMul_1MatMul,policy/main_graph_0_encoder0/flatten/Reshapeoptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/control_dependency*
transpose_a(*
transpose_b( *
T0
ź
zoptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/tuple/group_depsNoOpq^optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMuls^optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMul_1

optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/tuple/control_dependencyIdentitypoptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMul{^optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/tuple/group_deps*
T0*
_classy
wuloc:@optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMul

optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/tuple/control_dependency_1Identityroptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMul_1{^optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/tuple/group_deps*
T0*
_class{
ywloc:@optimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMul_1

Koptimizer/gradients/policy/main_graph_0_encoder0/flatten/Reshape_grad/ShapeShape'policy/main_graph_0_encoder0/conv_2/Elu*
T0*
out_type0
Į
Moptimizer/gradients/policy/main_graph_0_encoder0/flatten/Reshape_grad/ReshapeReshapeoptimizer/gradients/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/tuple/control_dependencyKoptimizer/gradients/policy/main_graph_0_encoder0/flatten/Reshape_grad/Shape*
Tshape0*
T0
Ō
Hoptimizer/gradients/policy/main_graph_0_encoder0/conv_2/Elu_grad/EluGradEluGradMoptimizer/gradients/policy/main_graph_0_encoder0/flatten/Reshape_grad/Reshape'policy/main_graph_0_encoder0/conv_2/Elu*
T0
É
Poptimizer/gradients/policy/main_graph_0_encoder0/conv_2/BiasAdd_grad/BiasAddGradBiasAddGradHoptimizer/gradients/policy/main_graph_0_encoder0/conv_2/Elu_grad/EluGrad*
T0*
data_formatNHWC
ū
Uoptimizer/gradients/policy/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/group_depsNoOpQ^optimizer/gradients/policy/main_graph_0_encoder0/conv_2/BiasAdd_grad/BiasAddGradI^optimizer/gradients/policy/main_graph_0_encoder0/conv_2/Elu_grad/EluGrad
ń
]optimizer/gradients/policy/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/control_dependencyIdentityHoptimizer/gradients/policy/main_graph_0_encoder0/conv_2/Elu_grad/EluGradV^optimizer/gradients/policy/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/group_deps*[
_classQ
OMloc:@optimizer/gradients/policy/main_graph_0_encoder0/conv_2/Elu_grad/EluGrad*
T0

_optimizer/gradients/policy/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/control_dependency_1IdentityPoptimizer/gradients/policy/main_graph_0_encoder0/conv_2/BiasAdd_grad/BiasAddGradV^optimizer/gradients/policy/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/group_deps*
T0*c
_classY
WUloc:@optimizer/gradients/policy/main_graph_0_encoder0/conv_2/BiasAdd_grad/BiasAddGrad
Š
Joptimizer/gradients/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/ShapeNShapeN'policy/main_graph_0_encoder0/conv_1/Elu/policy/main_graph_0_encoder0/conv_2/kernel/read*
T0*
out_type0*
N
Ū
Woptimizer/gradients/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropInputConv2DBackpropInputJoptimizer/gradients/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/ShapeN/policy/main_graph_0_encoder0/conv_2/kernel/read]optimizer/gradients/policy/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/control_dependency*
paddingVALID*
	dilations
*
T0*
strides
*
data_formatNHWC*
use_cudnn_on_gpu(*
explicit_paddings
 
×
Xoptimizer/gradients/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropFilterConv2DBackpropFilter'policy/main_graph_0_encoder0/conv_1/EluLoptimizer/gradients/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/ShapeN:1]optimizer/gradients/policy/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/control_dependency*
paddingVALID*
	dilations
*
T0*
data_formatNHWC*
strides
*
explicit_paddings
 *
use_cudnn_on_gpu(

Toptimizer/gradients/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/tuple/group_depsNoOpY^optimizer/gradients/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropFilterX^optimizer/gradients/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropInput

\optimizer/gradients/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/tuple/control_dependencyIdentityWoptimizer/gradients/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropInputU^optimizer/gradients/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/tuple/group_deps*
T0*j
_class`
^\loc:@optimizer/gradients/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropInput

^optimizer/gradients/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/tuple/control_dependency_1IdentityXoptimizer/gradients/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropFilterU^optimizer/gradients/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/tuple/group_deps*
T0*k
_classa
_]loc:@optimizer/gradients/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropFilter
ć
Hoptimizer/gradients/policy/main_graph_0_encoder0/conv_1/Elu_grad/EluGradEluGrad\optimizer/gradients/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/tuple/control_dependency'policy/main_graph_0_encoder0/conv_1/Elu*
T0
É
Poptimizer/gradients/policy/main_graph_0_encoder0/conv_1/BiasAdd_grad/BiasAddGradBiasAddGradHoptimizer/gradients/policy/main_graph_0_encoder0/conv_1/Elu_grad/EluGrad*
T0*
data_formatNHWC
ū
Uoptimizer/gradients/policy/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/group_depsNoOpQ^optimizer/gradients/policy/main_graph_0_encoder0/conv_1/BiasAdd_grad/BiasAddGradI^optimizer/gradients/policy/main_graph_0_encoder0/conv_1/Elu_grad/EluGrad
ń
]optimizer/gradients/policy/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/control_dependencyIdentityHoptimizer/gradients/policy/main_graph_0_encoder0/conv_1/Elu_grad/EluGradV^optimizer/gradients/policy/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/group_deps*
T0*[
_classQ
OMloc:@optimizer/gradients/policy/main_graph_0_encoder0/conv_1/Elu_grad/EluGrad

_optimizer/gradients/policy/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/control_dependency_1IdentityPoptimizer/gradients/policy/main_graph_0_encoder0/conv_1/BiasAdd_grad/BiasAddGradV^optimizer/gradients/policy/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/group_deps*c
_classY
WUloc:@optimizer/gradients/policy/main_graph_0_encoder0/conv_1/BiasAdd_grad/BiasAddGrad*
T0
½
Joptimizer/gradients/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/ShapeNShapeNvisual_observation_0/policy/main_graph_0_encoder0/conv_1/kernel/read*
T0*
out_type0*
N
Ū
Woptimizer/gradients/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropInputConv2DBackpropInputJoptimizer/gradients/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/ShapeN/policy/main_graph_0_encoder0/conv_1/kernel/read]optimizer/gradients/policy/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/control_dependency*
	dilations
*
T0*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingVALID
Ä
Xoptimizer/gradients/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropFilterConv2DBackpropFiltervisual_observation_0Loptimizer/gradients/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/ShapeN:1]optimizer/gradients/policy/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/control_dependency*
	dilations
*
T0*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
explicit_paddings
 *
paddingVALID

Toptimizer/gradients/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/tuple/group_depsNoOpY^optimizer/gradients/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropFilterX^optimizer/gradients/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropInput

\optimizer/gradients/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/tuple/control_dependencyIdentityWoptimizer/gradients/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropInputU^optimizer/gradients/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/tuple/group_deps*j
_class`
^\loc:@optimizer/gradients/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropInput*
T0

^optimizer/gradients/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/tuple/control_dependency_1IdentityXoptimizer/gradients/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropFilterU^optimizer/gradients/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/tuple/group_deps*k
_classa
_]loc:@optimizer/gradients/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropFilter*
T0
D
optimizer/gradients_1/ShapeConst*
valueB *
dtype0
L
optimizer/gradients_1/grad_ys_0Const*
valueB
 *  ?*
dtype0
{
optimizer/gradients_1/FillFilloptimizer/gradients_1/Shapeoptimizer/gradients_1/grad_ys_0*
T0*

index_type0
Z
.optimizer/gradients_1/optimizer/sub_3_grad/NegNegoptimizer/gradients_1/Fill*
T0

;optimizer/gradients_1/optimizer/sub_3_grad/tuple/group_depsNoOp^optimizer/gradients_1/Fill/^optimizer/gradients_1/optimizer/sub_3_grad/Neg
į
Coptimizer/gradients_1/optimizer/sub_3_grad/tuple/control_dependencyIdentityoptimizer/gradients_1/Fill<^optimizer/gradients_1/optimizer/sub_3_grad/tuple/group_deps*
T0*-
_class#
!loc:@optimizer/gradients_1/Fill

Eoptimizer/gradients_1/optimizer/sub_3_grad/tuple/control_dependency_1Identity.optimizer/gradients_1/optimizer/sub_3_grad/Neg<^optimizer/gradients_1/optimizer/sub_3_grad/tuple/group_deps*
T0*A
_class7
53loc:@optimizer/gradients_1/optimizer/sub_3_grad/Neg

;optimizer/gradients_1/optimizer/add_5_grad/tuple/group_depsNoOpD^optimizer/gradients_1/optimizer/sub_3_grad/tuple/control_dependency

Coptimizer/gradients_1/optimizer/add_5_grad/tuple/control_dependencyIdentityCoptimizer/gradients_1/optimizer/sub_3_grad/tuple/control_dependency<^optimizer/gradients_1/optimizer/add_5_grad/tuple/group_deps*
T0*-
_class#
!loc:@optimizer/gradients_1/Fill

Eoptimizer/gradients_1/optimizer/add_5_grad/tuple/control_dependency_1IdentityCoptimizer/gradients_1/optimizer/sub_3_grad/tuple/control_dependency<^optimizer/gradients_1/optimizer/add_5_grad/tuple/group_deps*
T0*-
_class#
!loc:@optimizer/gradients_1/Fill

.optimizer/gradients_1/optimizer/mul_4_grad/MulMulEoptimizer/gradients_1/optimizer/sub_3_grad/tuple/control_dependency_1optimizer/Mean_4*
T0
¤
0optimizer/gradients_1/optimizer/mul_4_grad/Mul_1MulEoptimizer/gradients_1/optimizer/sub_3_grad/tuple/control_dependency_1optimizer/PolynomialDecay_2*
T0
§
;optimizer/gradients_1/optimizer/mul_4_grad/tuple/group_depsNoOp/^optimizer/gradients_1/optimizer/mul_4_grad/Mul1^optimizer/gradients_1/optimizer/mul_4_grad/Mul_1

Coptimizer/gradients_1/optimizer/mul_4_grad/tuple/control_dependencyIdentity.optimizer/gradients_1/optimizer/mul_4_grad/Mul<^optimizer/gradients_1/optimizer/mul_4_grad/tuple/group_deps*
T0*A
_class7
53loc:@optimizer/gradients_1/optimizer/mul_4_grad/Mul

Eoptimizer/gradients_1/optimizer/mul_4_grad/tuple/control_dependency_1Identity0optimizer/gradients_1/optimizer/mul_4_grad/Mul_1<^optimizer/gradients_1/optimizer/mul_4_grad/tuple/group_deps*
T0*C
_class9
75loc:@optimizer/gradients_1/optimizer/mul_4_grad/Mul_1

.optimizer/gradients_1/optimizer/Neg_2_grad/NegNegCoptimizer/gradients_1/optimizer/add_5_grad/tuple/control_dependency*
T0

.optimizer/gradients_1/optimizer/mul_3_grad/MulMulEoptimizer/gradients_1/optimizer/add_5_grad/tuple/control_dependency_1optimizer/Mean_2*
T0

0optimizer/gradients_1/optimizer/mul_3_grad/Mul_1MulEoptimizer/gradients_1/optimizer/add_5_grad/tuple/control_dependency_1optimizer/mul_3/x*
T0
§
;optimizer/gradients_1/optimizer/mul_3_grad/tuple/group_depsNoOp/^optimizer/gradients_1/optimizer/mul_3_grad/Mul1^optimizer/gradients_1/optimizer/mul_3_grad/Mul_1

Coptimizer/gradients_1/optimizer/mul_3_grad/tuple/control_dependencyIdentity.optimizer/gradients_1/optimizer/mul_3_grad/Mul<^optimizer/gradients_1/optimizer/mul_3_grad/tuple/group_deps*A
_class7
53loc:@optimizer/gradients_1/optimizer/mul_3_grad/Mul*
T0

Eoptimizer/gradients_1/optimizer/mul_3_grad/tuple/control_dependency_1Identity0optimizer/gradients_1/optimizer/mul_3_grad/Mul_1<^optimizer/gradients_1/optimizer/mul_3_grad/tuple/group_deps*
T0*C
_class9
75loc:@optimizer/gradients_1/optimizer/mul_3_grad/Mul_1
g
9optimizer/gradients_1/optimizer/Mean_4_grad/Reshape/shapeConst*
valueB:*
dtype0
×
3optimizer/gradients_1/optimizer/Mean_4_grad/ReshapeReshapeEoptimizer/gradients_1/optimizer/mul_4_grad/tuple/control_dependency_19optimizer/gradients_1/optimizer/Mean_4_grad/Reshape/shape*
Tshape0*
T0
s
1optimizer/gradients_1/optimizer/Mean_4_grad/ShapeShapeoptimizer/DynamicPartition_2:1*
T0*
out_type0
»
0optimizer/gradients_1/optimizer/Mean_4_grad/TileTile3optimizer/gradients_1/optimizer/Mean_4_grad/Reshape1optimizer/gradients_1/optimizer/Mean_4_grad/Shape*

Tmultiples0*
T0
u
3optimizer/gradients_1/optimizer/Mean_4_grad/Shape_1Shapeoptimizer/DynamicPartition_2:1*
T0*
out_type0
\
3optimizer/gradients_1/optimizer/Mean_4_grad/Shape_2Const*
valueB *
dtype0
_
1optimizer/gradients_1/optimizer/Mean_4_grad/ConstConst*
valueB: *
dtype0
Ę
0optimizer/gradients_1/optimizer/Mean_4_grad/ProdProd3optimizer/gradients_1/optimizer/Mean_4_grad/Shape_11optimizer/gradients_1/optimizer/Mean_4_grad/Const*

Tidx0*
	keep_dims( *
T0
a
3optimizer/gradients_1/optimizer/Mean_4_grad/Const_1Const*
valueB: *
dtype0
Ź
2optimizer/gradients_1/optimizer/Mean_4_grad/Prod_1Prod3optimizer/gradients_1/optimizer/Mean_4_grad/Shape_23optimizer/gradients_1/optimizer/Mean_4_grad/Const_1*

Tidx0*
	keep_dims( *
T0
_
5optimizer/gradients_1/optimizer/Mean_4_grad/Maximum/yConst*
value	B :*
dtype0
²
3optimizer/gradients_1/optimizer/Mean_4_grad/MaximumMaximum2optimizer/gradients_1/optimizer/Mean_4_grad/Prod_15optimizer/gradients_1/optimizer/Mean_4_grad/Maximum/y*
T0
°
4optimizer/gradients_1/optimizer/Mean_4_grad/floordivFloorDiv0optimizer/gradients_1/optimizer/Mean_4_grad/Prod3optimizer/gradients_1/optimizer/Mean_4_grad/Maximum*
T0

0optimizer/gradients_1/optimizer/Mean_4_grad/CastCast4optimizer/gradients_1/optimizer/Mean_4_grad/floordiv*

SrcT0*
Truncate( *

DstT0
«
3optimizer/gradients_1/optimizer/Mean_4_grad/truedivRealDiv0optimizer/gradients_1/optimizer/Mean_4_grad/Tile0optimizer/gradients_1/optimizer/Mean_4_grad/Cast*
T0
n
9optimizer/gradients_1/optimizer/Mean_3_grad/Reshape/shapeConst*
valueB"      *
dtype0
Ą
3optimizer/gradients_1/optimizer/Mean_3_grad/ReshapeReshape.optimizer/gradients_1/optimizer/Neg_2_grad/Neg9optimizer/gradients_1/optimizer/Mean_3_grad/Reshape/shape*
T0*
Tshape0
s
1optimizer/gradients_1/optimizer/Mean_3_grad/ShapeShapeoptimizer/DynamicPartition_1:1*
T0*
out_type0
»
0optimizer/gradients_1/optimizer/Mean_3_grad/TileTile3optimizer/gradients_1/optimizer/Mean_3_grad/Reshape1optimizer/gradients_1/optimizer/Mean_3_grad/Shape*

Tmultiples0*
T0
u
3optimizer/gradients_1/optimizer/Mean_3_grad/Shape_1Shapeoptimizer/DynamicPartition_1:1*
T0*
out_type0
\
3optimizer/gradients_1/optimizer/Mean_3_grad/Shape_2Const*
valueB *
dtype0
_
1optimizer/gradients_1/optimizer/Mean_3_grad/ConstConst*
valueB: *
dtype0
Ę
0optimizer/gradients_1/optimizer/Mean_3_grad/ProdProd3optimizer/gradients_1/optimizer/Mean_3_grad/Shape_11optimizer/gradients_1/optimizer/Mean_3_grad/Const*
T0*

Tidx0*
	keep_dims( 
a
3optimizer/gradients_1/optimizer/Mean_3_grad/Const_1Const*
dtype0*
valueB: 
Ź
2optimizer/gradients_1/optimizer/Mean_3_grad/Prod_1Prod3optimizer/gradients_1/optimizer/Mean_3_grad/Shape_23optimizer/gradients_1/optimizer/Mean_3_grad/Const_1*
T0*

Tidx0*
	keep_dims( 
_
5optimizer/gradients_1/optimizer/Mean_3_grad/Maximum/yConst*
value	B :*
dtype0
²
3optimizer/gradients_1/optimizer/Mean_3_grad/MaximumMaximum2optimizer/gradients_1/optimizer/Mean_3_grad/Prod_15optimizer/gradients_1/optimizer/Mean_3_grad/Maximum/y*
T0
°
4optimizer/gradients_1/optimizer/Mean_3_grad/floordivFloorDiv0optimizer/gradients_1/optimizer/Mean_3_grad/Prod3optimizer/gradients_1/optimizer/Mean_3_grad/Maximum*
T0

0optimizer/gradients_1/optimizer/Mean_3_grad/CastCast4optimizer/gradients_1/optimizer/Mean_3_grad/floordiv*

SrcT0*
Truncate( *

DstT0
«
3optimizer/gradients_1/optimizer/Mean_3_grad/truedivRealDiv0optimizer/gradients_1/optimizer/Mean_3_grad/Tile0optimizer/gradients_1/optimizer/Mean_3_grad/Cast*
T0
g
9optimizer/gradients_1/optimizer/Mean_2_grad/Reshape/shapeConst*
dtype0*
valueB:
×
3optimizer/gradients_1/optimizer/Mean_2_grad/ReshapeReshapeEoptimizer/gradients_1/optimizer/mul_3_grad/tuple/control_dependency_19optimizer/gradients_1/optimizer/Mean_2_grad/Reshape/shape*
T0*
Tshape0
_
1optimizer/gradients_1/optimizer/Mean_2_grad/ConstConst*
dtype0*
valueB:
»
0optimizer/gradients_1/optimizer/Mean_2_grad/TileTile3optimizer/gradients_1/optimizer/Mean_2_grad/Reshape1optimizer/gradients_1/optimizer/Mean_2_grad/Const*

Tmultiples0*
T0
`
3optimizer/gradients_1/optimizer/Mean_2_grad/Const_1Const*
valueB
 *  ?*
dtype0
®
3optimizer/gradients_1/optimizer/Mean_2_grad/truedivRealDiv0optimizer/gradients_1/optimizer/Mean_2_grad/Tile3optimizer/gradients_1/optimizer/Mean_2_grad/Const_1*
T0
T
 optimizer/gradients_1/zeros_like	ZerosLikeoptimizer/DynamicPartition_2*
T0
g
=optimizer/gradients_1/optimizer/DynamicPartition_2_grad/ShapeShapeCast_2*
T0*
out_type0
k
=optimizer/gradients_1/optimizer/DynamicPartition_2_grad/ConstConst*
valueB: *
dtype0
č
<optimizer/gradients_1/optimizer/DynamicPartition_2_grad/ProdProd=optimizer/gradients_1/optimizer/DynamicPartition_2_grad/Shape=optimizer/gradients_1/optimizer/DynamicPartition_2_grad/Const*

Tidx0*
	keep_dims( *
T0
m
Coptimizer/gradients_1/optimizer/DynamicPartition_2_grad/range/startConst*
value	B : *
dtype0
m
Coptimizer/gradients_1/optimizer/DynamicPartition_2_grad/range/deltaConst*
value	B :*
dtype0

=optimizer/gradients_1/optimizer/DynamicPartition_2_grad/rangeRangeCoptimizer/gradients_1/optimizer/DynamicPartition_2_grad/range/start<optimizer/gradients_1/optimizer/DynamicPartition_2_grad/ProdCoptimizer/gradients_1/optimizer/DynamicPartition_2_grad/range/delta*

Tidx0
ß
?optimizer/gradients_1/optimizer/DynamicPartition_2_grad/ReshapeReshape=optimizer/gradients_1/optimizer/DynamicPartition_2_grad/range=optimizer/gradients_1/optimizer/DynamicPartition_2_grad/Shape*
Tshape0*
T0
Ä
Hoptimizer/gradients_1/optimizer/DynamicPartition_2_grad/DynamicPartitionDynamicPartition?optimizer/gradients_1/optimizer/DynamicPartition_2_grad/ReshapeCast_2*
T0*
num_partitions
Õ
Eoptimizer/gradients_1/optimizer/DynamicPartition_2_grad/DynamicStitchDynamicStitchHoptimizer/gradients_1/optimizer/DynamicPartition_2_grad/DynamicPartitionJoptimizer/gradients_1/optimizer/DynamicPartition_2_grad/DynamicPartition:1 optimizer/gradients_1/zeros_like3optimizer/gradients_1/optimizer/Mean_4_grad/truediv*
T0*
N
q
?optimizer/gradients_1/optimizer/DynamicPartition_2_grad/Shape_1Shapepolicy_1/Sum_1*
T0*
out_type0
ė
Aoptimizer/gradients_1/optimizer/DynamicPartition_2_grad/Reshape_1ReshapeEoptimizer/gradients_1/optimizer/DynamicPartition_2_grad/DynamicStitch?optimizer/gradients_1/optimizer/DynamicPartition_2_grad/Shape_1*
T0*
Tshape0
V
"optimizer/gradients_1/zeros_like_1	ZerosLikeoptimizer/DynamicPartition_1*
T0
g
=optimizer/gradients_1/optimizer/DynamicPartition_1_grad/ShapeShapeCast_2*
T0*
out_type0
k
=optimizer/gradients_1/optimizer/DynamicPartition_1_grad/ConstConst*
valueB: *
dtype0
č
<optimizer/gradients_1/optimizer/DynamicPartition_1_grad/ProdProd=optimizer/gradients_1/optimizer/DynamicPartition_1_grad/Shape=optimizer/gradients_1/optimizer/DynamicPartition_1_grad/Const*

Tidx0*
	keep_dims( *
T0
m
Coptimizer/gradients_1/optimizer/DynamicPartition_1_grad/range/startConst*
value	B : *
dtype0
m
Coptimizer/gradients_1/optimizer/DynamicPartition_1_grad/range/deltaConst*
value	B :*
dtype0

=optimizer/gradients_1/optimizer/DynamicPartition_1_grad/rangeRangeCoptimizer/gradients_1/optimizer/DynamicPartition_1_grad/range/start<optimizer/gradients_1/optimizer/DynamicPartition_1_grad/ProdCoptimizer/gradients_1/optimizer/DynamicPartition_1_grad/range/delta*

Tidx0
ß
?optimizer/gradients_1/optimizer/DynamicPartition_1_grad/ReshapeReshape=optimizer/gradients_1/optimizer/DynamicPartition_1_grad/range=optimizer/gradients_1/optimizer/DynamicPartition_1_grad/Shape*
T0*
Tshape0
Ä
Hoptimizer/gradients_1/optimizer/DynamicPartition_1_grad/DynamicPartitionDynamicPartition?optimizer/gradients_1/optimizer/DynamicPartition_1_grad/ReshapeCast_2*
T0*
num_partitions
×
Eoptimizer/gradients_1/optimizer/DynamicPartition_1_grad/DynamicStitchDynamicStitchHoptimizer/gradients_1/optimizer/DynamicPartition_1_grad/DynamicPartitionJoptimizer/gradients_1/optimizer/DynamicPartition_1_grad/DynamicPartition:1"optimizer/gradients_1/zeros_like_13optimizer/gradients_1/optimizer/Mean_3_grad/truediv*
T0*
N
t
?optimizer/gradients_1/optimizer/DynamicPartition_1_grad/Shape_1Shapeoptimizer/Minimum*
T0*
out_type0
ė
Aoptimizer/gradients_1/optimizer/DynamicPartition_1_grad/Reshape_1ReshapeEoptimizer/gradients_1/optimizer/DynamicPartition_1_grad/DynamicStitch?optimizer/gradients_1/optimizer/DynamicPartition_1_grad/Shape_1*
T0*
Tshape0

9optimizer/gradients_1/optimizer/Mean_2/input_grad/unstackUnpack3optimizer/gradients_1/optimizer/Mean_2_grad/truediv*
T0*	
num*

axis 
a
/optimizer/gradients_1/policy_1/Sum_1_grad/ShapeShapepolicy_1/stack*
T0*
out_type0

.optimizer/gradients_1/policy_1/Sum_1_grad/SizeConst*B
_class8
64loc:@optimizer/gradients_1/policy_1/Sum_1_grad/Shape*
value	B :*
dtype0
Ó
-optimizer/gradients_1/policy_1/Sum_1_grad/addAdd policy_1/Sum_1/reduction_indices.optimizer/gradients_1/policy_1/Sum_1_grad/Size*
T0*B
_class8
64loc:@optimizer/gradients_1/policy_1/Sum_1_grad/Shape
å
-optimizer/gradients_1/policy_1/Sum_1_grad/modFloorMod-optimizer/gradients_1/policy_1/Sum_1_grad/add.optimizer/gradients_1/policy_1/Sum_1_grad/Size*
T0*B
_class8
64loc:@optimizer/gradients_1/policy_1/Sum_1_grad/Shape

1optimizer/gradients_1/policy_1/Sum_1_grad/Shape_1Const*B
_class8
64loc:@optimizer/gradients_1/policy_1/Sum_1_grad/Shape*
valueB *
dtype0
£
5optimizer/gradients_1/policy_1/Sum_1_grad/range/startConst*
dtype0*B
_class8
64loc:@optimizer/gradients_1/policy_1/Sum_1_grad/Shape*
value	B : 
£
5optimizer/gradients_1/policy_1/Sum_1_grad/range/deltaConst*B
_class8
64loc:@optimizer/gradients_1/policy_1/Sum_1_grad/Shape*
value	B :*
dtype0
¦
/optimizer/gradients_1/policy_1/Sum_1_grad/rangeRange5optimizer/gradients_1/policy_1/Sum_1_grad/range/start.optimizer/gradients_1/policy_1/Sum_1_grad/Size5optimizer/gradients_1/policy_1/Sum_1_grad/range/delta*

Tidx0*B
_class8
64loc:@optimizer/gradients_1/policy_1/Sum_1_grad/Shape
¢
4optimizer/gradients_1/policy_1/Sum_1_grad/Fill/valueConst*
dtype0*B
_class8
64loc:@optimizer/gradients_1/policy_1/Sum_1_grad/Shape*
value	B :
ž
.optimizer/gradients_1/policy_1/Sum_1_grad/FillFill1optimizer/gradients_1/policy_1/Sum_1_grad/Shape_14optimizer/gradients_1/policy_1/Sum_1_grad/Fill/value*B
_class8
64loc:@optimizer/gradients_1/policy_1/Sum_1_grad/Shape*

index_type0*
T0
ß
7optimizer/gradients_1/policy_1/Sum_1_grad/DynamicStitchDynamicStitch/optimizer/gradients_1/policy_1/Sum_1_grad/range-optimizer/gradients_1/policy_1/Sum_1_grad/mod/optimizer/gradients_1/policy_1/Sum_1_grad/Shape.optimizer/gradients_1/policy_1/Sum_1_grad/Fill*
N*
T0*B
_class8
64loc:@optimizer/gradients_1/policy_1/Sum_1_grad/Shape
”
3optimizer/gradients_1/policy_1/Sum_1_grad/Maximum/yConst*B
_class8
64loc:@optimizer/gradients_1/policy_1/Sum_1_grad/Shape*
value	B :*
dtype0
÷
1optimizer/gradients_1/policy_1/Sum_1_grad/MaximumMaximum7optimizer/gradients_1/policy_1/Sum_1_grad/DynamicStitch3optimizer/gradients_1/policy_1/Sum_1_grad/Maximum/y*
T0*B
_class8
64loc:@optimizer/gradients_1/policy_1/Sum_1_grad/Shape
ļ
2optimizer/gradients_1/policy_1/Sum_1_grad/floordivFloorDiv/optimizer/gradients_1/policy_1/Sum_1_grad/Shape1optimizer/gradients_1/policy_1/Sum_1_grad/Maximum*
T0*B
_class8
64loc:@optimizer/gradients_1/policy_1/Sum_1_grad/Shape
Ļ
1optimizer/gradients_1/policy_1/Sum_1_grad/ReshapeReshapeAoptimizer/gradients_1/optimizer/DynamicPartition_2_grad/Reshape_17optimizer/gradients_1/policy_1/Sum_1_grad/DynamicStitch*
Tshape0*
T0
ø
.optimizer/gradients_1/policy_1/Sum_1_grad/TileTile1optimizer/gradients_1/policy_1/Sum_1_grad/Reshape2optimizer/gradients_1/policy_1/Sum_1_grad/floordiv*

Tmultiples0*
T0
e
2optimizer/gradients_1/optimizer/Minimum_grad/ShapeShapeoptimizer/mul_1*
T0*
out_type0
g
4optimizer/gradients_1/optimizer/Minimum_grad/Shape_1Shapeoptimizer/mul_2*
T0*
out_type0

4optimizer/gradients_1/optimizer/Minimum_grad/Shape_2ShapeAoptimizer/gradients_1/optimizer/DynamicPartition_1_grad/Reshape_1*
T0*
out_type0
e
8optimizer/gradients_1/optimizer/Minimum_grad/zeros/ConstConst*
valueB
 *    *
dtype0
Å
2optimizer/gradients_1/optimizer/Minimum_grad/zerosFill4optimizer/gradients_1/optimizer/Minimum_grad/Shape_28optimizer/gradients_1/optimizer/Minimum_grad/zeros/Const*
T0*

index_type0
n
6optimizer/gradients_1/optimizer/Minimum_grad/LessEqual	LessEqualoptimizer/mul_1optimizer/mul_2*
T0
Ī
Boptimizer/gradients_1/optimizer/Minimum_grad/BroadcastGradientArgsBroadcastGradientArgs2optimizer/gradients_1/optimizer/Minimum_grad/Shape4optimizer/gradients_1/optimizer/Minimum_grad/Shape_1*
T0
õ
3optimizer/gradients_1/optimizer/Minimum_grad/SelectSelect6optimizer/gradients_1/optimizer/Minimum_grad/LessEqualAoptimizer/gradients_1/optimizer/DynamicPartition_1_grad/Reshape_12optimizer/gradients_1/optimizer/Minimum_grad/zeros*
T0
Ö
0optimizer/gradients_1/optimizer/Minimum_grad/SumSum3optimizer/gradients_1/optimizer/Minimum_grad/SelectBoptimizer/gradients_1/optimizer/Minimum_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
¼
4optimizer/gradients_1/optimizer/Minimum_grad/ReshapeReshape0optimizer/gradients_1/optimizer/Minimum_grad/Sum2optimizer/gradients_1/optimizer/Minimum_grad/Shape*
T0*
Tshape0
÷
5optimizer/gradients_1/optimizer/Minimum_grad/Select_1Select6optimizer/gradients_1/optimizer/Minimum_grad/LessEqual2optimizer/gradients_1/optimizer/Minimum_grad/zerosAoptimizer/gradients_1/optimizer/DynamicPartition_1_grad/Reshape_1*
T0
Ü
2optimizer/gradients_1/optimizer/Minimum_grad/Sum_1Sum5optimizer/gradients_1/optimizer/Minimum_grad/Select_1Doptimizer/gradients_1/optimizer/Minimum_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
Ā
6optimizer/gradients_1/optimizer/Minimum_grad/Reshape_1Reshape2optimizer/gradients_1/optimizer/Minimum_grad/Sum_14optimizer/gradients_1/optimizer/Minimum_grad/Shape_1*
T0*
Tshape0
µ
=optimizer/gradients_1/optimizer/Minimum_grad/tuple/group_depsNoOp5^optimizer/gradients_1/optimizer/Minimum_grad/Reshape7^optimizer/gradients_1/optimizer/Minimum_grad/Reshape_1

Eoptimizer/gradients_1/optimizer/Minimum_grad/tuple/control_dependencyIdentity4optimizer/gradients_1/optimizer/Minimum_grad/Reshape>^optimizer/gradients_1/optimizer/Minimum_grad/tuple/group_deps*
T0*G
_class=
;9loc:@optimizer/gradients_1/optimizer/Minimum_grad/Reshape

Goptimizer/gradients_1/optimizer/Minimum_grad/tuple/control_dependency_1Identity6optimizer/gradients_1/optimizer/Minimum_grad/Reshape_1>^optimizer/gradients_1/optimizer/Minimum_grad/tuple/group_deps*
T0*I
_class?
=;loc:@optimizer/gradients_1/optimizer/Minimum_grad/Reshape_1
g
9optimizer/gradients_1/optimizer/Mean_1_grad/Reshape/shapeConst*
valueB:*
dtype0
Ė
3optimizer/gradients_1/optimizer/Mean_1_grad/ReshapeReshape9optimizer/gradients_1/optimizer/Mean_2/input_grad/unstack9optimizer/gradients_1/optimizer/Mean_1_grad/Reshape/shape*
T0*
Tshape0
q
1optimizer/gradients_1/optimizer/Mean_1_grad/ShapeShapeoptimizer/DynamicPartition:1*
T0*
out_type0
»
0optimizer/gradients_1/optimizer/Mean_1_grad/TileTile3optimizer/gradients_1/optimizer/Mean_1_grad/Reshape1optimizer/gradients_1/optimizer/Mean_1_grad/Shape*

Tmultiples0*
T0
s
3optimizer/gradients_1/optimizer/Mean_1_grad/Shape_1Shapeoptimizer/DynamicPartition:1*
T0*
out_type0
\
3optimizer/gradients_1/optimizer/Mean_1_grad/Shape_2Const*
dtype0*
valueB 
_
1optimizer/gradients_1/optimizer/Mean_1_grad/ConstConst*
valueB: *
dtype0
Ę
0optimizer/gradients_1/optimizer/Mean_1_grad/ProdProd3optimizer/gradients_1/optimizer/Mean_1_grad/Shape_11optimizer/gradients_1/optimizer/Mean_1_grad/Const*
T0*

Tidx0*
	keep_dims( 
a
3optimizer/gradients_1/optimizer/Mean_1_grad/Const_1Const*
dtype0*
valueB: 
Ź
2optimizer/gradients_1/optimizer/Mean_1_grad/Prod_1Prod3optimizer/gradients_1/optimizer/Mean_1_grad/Shape_23optimizer/gradients_1/optimizer/Mean_1_grad/Const_1*

Tidx0*
	keep_dims( *
T0
_
5optimizer/gradients_1/optimizer/Mean_1_grad/Maximum/yConst*
value	B :*
dtype0
²
3optimizer/gradients_1/optimizer/Mean_1_grad/MaximumMaximum2optimizer/gradients_1/optimizer/Mean_1_grad/Prod_15optimizer/gradients_1/optimizer/Mean_1_grad/Maximum/y*
T0
°
4optimizer/gradients_1/optimizer/Mean_1_grad/floordivFloorDiv0optimizer/gradients_1/optimizer/Mean_1_grad/Prod3optimizer/gradients_1/optimizer/Mean_1_grad/Maximum*
T0

0optimizer/gradients_1/optimizer/Mean_1_grad/CastCast4optimizer/gradients_1/optimizer/Mean_1_grad/floordiv*

DstT0*

SrcT0*
Truncate( 
«
3optimizer/gradients_1/optimizer/Mean_1_grad/truedivRealDiv0optimizer/gradients_1/optimizer/Mean_1_grad/Tile0optimizer/gradients_1/optimizer/Mean_1_grad/Cast*
T0

1optimizer/gradients_1/policy_1/stack_grad/unstackUnpack.optimizer/gradients_1/policy_1/Sum_1_grad/Tile*
T0*	
num*

axis
a
0optimizer/gradients_1/optimizer/mul_1_grad/ShapeShapeoptimizer/Exp*
T0*
out_type0
j
2optimizer/gradients_1/optimizer/mul_1_grad/Shape_1Shapeoptimizer/ExpandDims*
out_type0*
T0
Č
@optimizer/gradients_1/optimizer/mul_1_grad/BroadcastGradientArgsBroadcastGradientArgs0optimizer/gradients_1/optimizer/mul_1_grad/Shape2optimizer/gradients_1/optimizer/mul_1_grad/Shape_1*
T0

.optimizer/gradients_1/optimizer/mul_1_grad/MulMulEoptimizer/gradients_1/optimizer/Minimum_grad/tuple/control_dependencyoptimizer/ExpandDims*
T0
Ķ
.optimizer/gradients_1/optimizer/mul_1_grad/SumSum.optimizer/gradients_1/optimizer/mul_1_grad/Mul@optimizer/gradients_1/optimizer/mul_1_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
¶
2optimizer/gradients_1/optimizer/mul_1_grad/ReshapeReshape.optimizer/gradients_1/optimizer/mul_1_grad/Sum0optimizer/gradients_1/optimizer/mul_1_grad/Shape*
T0*
Tshape0

0optimizer/gradients_1/optimizer/mul_1_grad/Mul_1Muloptimizer/ExpEoptimizer/gradients_1/optimizer/Minimum_grad/tuple/control_dependency*
T0
Ó
0optimizer/gradients_1/optimizer/mul_1_grad/Sum_1Sum0optimizer/gradients_1/optimizer/mul_1_grad/Mul_1Boptimizer/gradients_1/optimizer/mul_1_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
¼
4optimizer/gradients_1/optimizer/mul_1_grad/Reshape_1Reshape0optimizer/gradients_1/optimizer/mul_1_grad/Sum_12optimizer/gradients_1/optimizer/mul_1_grad/Shape_1*
T0*
Tshape0
Æ
;optimizer/gradients_1/optimizer/mul_1_grad/tuple/group_depsNoOp3^optimizer/gradients_1/optimizer/mul_1_grad/Reshape5^optimizer/gradients_1/optimizer/mul_1_grad/Reshape_1

Coptimizer/gradients_1/optimizer/mul_1_grad/tuple/control_dependencyIdentity2optimizer/gradients_1/optimizer/mul_1_grad/Reshape<^optimizer/gradients_1/optimizer/mul_1_grad/tuple/group_deps*
T0*E
_class;
97loc:@optimizer/gradients_1/optimizer/mul_1_grad/Reshape

Eoptimizer/gradients_1/optimizer/mul_1_grad/tuple/control_dependency_1Identity4optimizer/gradients_1/optimizer/mul_1_grad/Reshape_1<^optimizer/gradients_1/optimizer/mul_1_grad/tuple/group_deps*
T0*G
_class=
;9loc:@optimizer/gradients_1/optimizer/mul_1_grad/Reshape_1
m
0optimizer/gradients_1/optimizer/mul_2_grad/ShapeShapeoptimizer/clip_by_value_1*
T0*
out_type0
j
2optimizer/gradients_1/optimizer/mul_2_grad/Shape_1Shapeoptimizer/ExpandDims*
out_type0*
T0
Č
@optimizer/gradients_1/optimizer/mul_2_grad/BroadcastGradientArgsBroadcastGradientArgs0optimizer/gradients_1/optimizer/mul_2_grad/Shape2optimizer/gradients_1/optimizer/mul_2_grad/Shape_1*
T0

.optimizer/gradients_1/optimizer/mul_2_grad/MulMulGoptimizer/gradients_1/optimizer/Minimum_grad/tuple/control_dependency_1optimizer/ExpandDims*
T0
Ķ
.optimizer/gradients_1/optimizer/mul_2_grad/SumSum.optimizer/gradients_1/optimizer/mul_2_grad/Mul@optimizer/gradients_1/optimizer/mul_2_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
¶
2optimizer/gradients_1/optimizer/mul_2_grad/ReshapeReshape.optimizer/gradients_1/optimizer/mul_2_grad/Sum0optimizer/gradients_1/optimizer/mul_2_grad/Shape*
T0*
Tshape0
¤
0optimizer/gradients_1/optimizer/mul_2_grad/Mul_1Muloptimizer/clip_by_value_1Goptimizer/gradients_1/optimizer/Minimum_grad/tuple/control_dependency_1*
T0
Ó
0optimizer/gradients_1/optimizer/mul_2_grad/Sum_1Sum0optimizer/gradients_1/optimizer/mul_2_grad/Mul_1Boptimizer/gradients_1/optimizer/mul_2_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
¼
4optimizer/gradients_1/optimizer/mul_2_grad/Reshape_1Reshape0optimizer/gradients_1/optimizer/mul_2_grad/Sum_12optimizer/gradients_1/optimizer/mul_2_grad/Shape_1*
Tshape0*
T0
Æ
;optimizer/gradients_1/optimizer/mul_2_grad/tuple/group_depsNoOp3^optimizer/gradients_1/optimizer/mul_2_grad/Reshape5^optimizer/gradients_1/optimizer/mul_2_grad/Reshape_1

Coptimizer/gradients_1/optimizer/mul_2_grad/tuple/control_dependencyIdentity2optimizer/gradients_1/optimizer/mul_2_grad/Reshape<^optimizer/gradients_1/optimizer/mul_2_grad/tuple/group_deps*
T0*E
_class;
97loc:@optimizer/gradients_1/optimizer/mul_2_grad/Reshape

Eoptimizer/gradients_1/optimizer/mul_2_grad/tuple/control_dependency_1Identity4optimizer/gradients_1/optimizer/mul_2_grad/Reshape_1<^optimizer/gradients_1/optimizer/mul_2_grad/tuple/group_deps*
T0*G
_class=
;9loc:@optimizer/gradients_1/optimizer/mul_2_grad/Reshape_1
T
"optimizer/gradients_1/zeros_like_2	ZerosLikeoptimizer/DynamicPartition*
T0
e
;optimizer/gradients_1/optimizer/DynamicPartition_grad/ShapeShapeCast_2*
out_type0*
T0
i
;optimizer/gradients_1/optimizer/DynamicPartition_grad/ConstConst*
dtype0*
valueB: 
ā
:optimizer/gradients_1/optimizer/DynamicPartition_grad/ProdProd;optimizer/gradients_1/optimizer/DynamicPartition_grad/Shape;optimizer/gradients_1/optimizer/DynamicPartition_grad/Const*

Tidx0*
	keep_dims( *
T0
k
Aoptimizer/gradients_1/optimizer/DynamicPartition_grad/range/startConst*
dtype0*
value	B : 
k
Aoptimizer/gradients_1/optimizer/DynamicPartition_grad/range/deltaConst*
value	B :*
dtype0

;optimizer/gradients_1/optimizer/DynamicPartition_grad/rangeRangeAoptimizer/gradients_1/optimizer/DynamicPartition_grad/range/start:optimizer/gradients_1/optimizer/DynamicPartition_grad/ProdAoptimizer/gradients_1/optimizer/DynamicPartition_grad/range/delta*

Tidx0
Ł
=optimizer/gradients_1/optimizer/DynamicPartition_grad/ReshapeReshape;optimizer/gradients_1/optimizer/DynamicPartition_grad/range;optimizer/gradients_1/optimizer/DynamicPartition_grad/Shape*
T0*
Tshape0
Ą
Foptimizer/gradients_1/optimizer/DynamicPartition_grad/DynamicPartitionDynamicPartition=optimizer/gradients_1/optimizer/DynamicPartition_grad/ReshapeCast_2*
num_partitions*
T0
Ń
Coptimizer/gradients_1/optimizer/DynamicPartition_grad/DynamicStitchDynamicStitchFoptimizer/gradients_1/optimizer/DynamicPartition_grad/DynamicPartitionHoptimizer/gradients_1/optimizer/DynamicPartition_grad/DynamicPartition:1"optimizer/gradients_1/zeros_like_23optimizer/gradients_1/optimizer/Mean_1_grad/truediv*
T0*
N
r
=optimizer/gradients_1/optimizer/DynamicPartition_grad/Shape_1Shapeoptimizer/Maximum*
T0*
out_type0
å
?optimizer/gradients_1/optimizer/DynamicPartition_grad/Reshape_1ReshapeCoptimizer/gradients_1/optimizer/DynamicPartition_grad/DynamicStitch=optimizer/gradients_1/optimizer/DynamicPartition_grad/Shape_1*
T0*
Tshape0
£
Uoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits/Reshape_2_grad/ShapeShape*policy_1/softmax_cross_entropy_with_logits*
T0*
out_type0

Woptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits/Reshape_2_grad/ReshapeReshape1optimizer/gradients_1/policy_1/stack_grad/unstackUoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits/Reshape_2_grad/Shape*
T0*
Tshape0

:optimizer/gradients_1/optimizer/clip_by_value_1_grad/ShapeShape!optimizer/clip_by_value_1/Minimum*
T0*
out_type0
e
<optimizer/gradients_1/optimizer/clip_by_value_1_grad/Shape_1Const*
valueB *
dtype0
£
<optimizer/gradients_1/optimizer/clip_by_value_1_grad/Shape_2ShapeCoptimizer/gradients_1/optimizer/mul_2_grad/tuple/control_dependency*
out_type0*
T0
m
@optimizer/gradients_1/optimizer/clip_by_value_1_grad/zeros/ConstConst*
valueB
 *    *
dtype0
Ż
:optimizer/gradients_1/optimizer/clip_by_value_1_grad/zerosFill<optimizer/gradients_1/optimizer/clip_by_value_1_grad/Shape_2@optimizer/gradients_1/optimizer/clip_by_value_1_grad/zeros/Const*
T0*

index_type0

Aoptimizer/gradients_1/optimizer/clip_by_value_1_grad/GreaterEqualGreaterEqual!optimizer/clip_by_value_1/Minimumoptimizer/sub_2*
T0
ę
Joptimizer/gradients_1/optimizer/clip_by_value_1_grad/BroadcastGradientArgsBroadcastGradientArgs:optimizer/gradients_1/optimizer/clip_by_value_1_grad/Shape<optimizer/gradients_1/optimizer/clip_by_value_1_grad/Shape_1*
T0

;optimizer/gradients_1/optimizer/clip_by_value_1_grad/SelectSelectAoptimizer/gradients_1/optimizer/clip_by_value_1_grad/GreaterEqualCoptimizer/gradients_1/optimizer/mul_2_grad/tuple/control_dependency:optimizer/gradients_1/optimizer/clip_by_value_1_grad/zeros*
T0
ī
8optimizer/gradients_1/optimizer/clip_by_value_1_grad/SumSum;optimizer/gradients_1/optimizer/clip_by_value_1_grad/SelectJoptimizer/gradients_1/optimizer/clip_by_value_1_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
Ō
<optimizer/gradients_1/optimizer/clip_by_value_1_grad/ReshapeReshape8optimizer/gradients_1/optimizer/clip_by_value_1_grad/Sum:optimizer/gradients_1/optimizer/clip_by_value_1_grad/Shape*
T0*
Tshape0

=optimizer/gradients_1/optimizer/clip_by_value_1_grad/Select_1SelectAoptimizer/gradients_1/optimizer/clip_by_value_1_grad/GreaterEqual:optimizer/gradients_1/optimizer/clip_by_value_1_grad/zerosCoptimizer/gradients_1/optimizer/mul_2_grad/tuple/control_dependency*
T0
ō
:optimizer/gradients_1/optimizer/clip_by_value_1_grad/Sum_1Sum=optimizer/gradients_1/optimizer/clip_by_value_1_grad/Select_1Loptimizer/gradients_1/optimizer/clip_by_value_1_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
Ś
>optimizer/gradients_1/optimizer/clip_by_value_1_grad/Reshape_1Reshape:optimizer/gradients_1/optimizer/clip_by_value_1_grad/Sum_1<optimizer/gradients_1/optimizer/clip_by_value_1_grad/Shape_1*
T0*
Tshape0
Ķ
Eoptimizer/gradients_1/optimizer/clip_by_value_1_grad/tuple/group_depsNoOp=^optimizer/gradients_1/optimizer/clip_by_value_1_grad/Reshape?^optimizer/gradients_1/optimizer/clip_by_value_1_grad/Reshape_1
¹
Moptimizer/gradients_1/optimizer/clip_by_value_1_grad/tuple/control_dependencyIdentity<optimizer/gradients_1/optimizer/clip_by_value_1_grad/ReshapeF^optimizer/gradients_1/optimizer/clip_by_value_1_grad/tuple/group_deps*
T0*O
_classE
CAloc:@optimizer/gradients_1/optimizer/clip_by_value_1_grad/Reshape
æ
Ooptimizer/gradients_1/optimizer/clip_by_value_1_grad/tuple/control_dependency_1Identity>optimizer/gradients_1/optimizer/clip_by_value_1_grad/Reshape_1F^optimizer/gradients_1/optimizer/clip_by_value_1_grad/tuple/group_deps*
T0*Q
_classG
ECloc:@optimizer/gradients_1/optimizer/clip_by_value_1_grad/Reshape_1
q
2optimizer/gradients_1/optimizer/Maximum_grad/ShapeShapeoptimizer/SquaredDifference*
out_type0*
T0
u
4optimizer/gradients_1/optimizer/Maximum_grad/Shape_1Shapeoptimizer/SquaredDifference_1*
T0*
out_type0

4optimizer/gradients_1/optimizer/Maximum_grad/Shape_2Shape?optimizer/gradients_1/optimizer/DynamicPartition_grad/Reshape_1*
T0*
out_type0
e
8optimizer/gradients_1/optimizer/Maximum_grad/zeros/ConstConst*
valueB
 *    *
dtype0
Å
2optimizer/gradients_1/optimizer/Maximum_grad/zerosFill4optimizer/gradients_1/optimizer/Maximum_grad/Shape_28optimizer/gradients_1/optimizer/Maximum_grad/zeros/Const*
T0*

index_type0

9optimizer/gradients_1/optimizer/Maximum_grad/GreaterEqualGreaterEqualoptimizer/SquaredDifferenceoptimizer/SquaredDifference_1*
T0
Ī
Boptimizer/gradients_1/optimizer/Maximum_grad/BroadcastGradientArgsBroadcastGradientArgs2optimizer/gradients_1/optimizer/Maximum_grad/Shape4optimizer/gradients_1/optimizer/Maximum_grad/Shape_1*
T0
ö
3optimizer/gradients_1/optimizer/Maximum_grad/SelectSelect9optimizer/gradients_1/optimizer/Maximum_grad/GreaterEqual?optimizer/gradients_1/optimizer/DynamicPartition_grad/Reshape_12optimizer/gradients_1/optimizer/Maximum_grad/zeros*
T0
Ö
0optimizer/gradients_1/optimizer/Maximum_grad/SumSum3optimizer/gradients_1/optimizer/Maximum_grad/SelectBoptimizer/gradients_1/optimizer/Maximum_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
¼
4optimizer/gradients_1/optimizer/Maximum_grad/ReshapeReshape0optimizer/gradients_1/optimizer/Maximum_grad/Sum2optimizer/gradients_1/optimizer/Maximum_grad/Shape*
Tshape0*
T0
ų
5optimizer/gradients_1/optimizer/Maximum_grad/Select_1Select9optimizer/gradients_1/optimizer/Maximum_grad/GreaterEqual2optimizer/gradients_1/optimizer/Maximum_grad/zeros?optimizer/gradients_1/optimizer/DynamicPartition_grad/Reshape_1*
T0
Ü
2optimizer/gradients_1/optimizer/Maximum_grad/Sum_1Sum5optimizer/gradients_1/optimizer/Maximum_grad/Select_1Doptimizer/gradients_1/optimizer/Maximum_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
Ā
6optimizer/gradients_1/optimizer/Maximum_grad/Reshape_1Reshape2optimizer/gradients_1/optimizer/Maximum_grad/Sum_14optimizer/gradients_1/optimizer/Maximum_grad/Shape_1*
T0*
Tshape0
µ
=optimizer/gradients_1/optimizer/Maximum_grad/tuple/group_depsNoOp5^optimizer/gradients_1/optimizer/Maximum_grad/Reshape7^optimizer/gradients_1/optimizer/Maximum_grad/Reshape_1

Eoptimizer/gradients_1/optimizer/Maximum_grad/tuple/control_dependencyIdentity4optimizer/gradients_1/optimizer/Maximum_grad/Reshape>^optimizer/gradients_1/optimizer/Maximum_grad/tuple/group_deps*
T0*G
_class=
;9loc:@optimizer/gradients_1/optimizer/Maximum_grad/Reshape

Goptimizer/gradients_1/optimizer/Maximum_grad/tuple/control_dependency_1Identity6optimizer/gradients_1/optimizer/Maximum_grad/Reshape_1>^optimizer/gradients_1/optimizer/Maximum_grad/tuple/group_deps*
T0*I
_class?
=;loc:@optimizer/gradients_1/optimizer/Maximum_grad/Reshape_1
f
"optimizer/gradients_1/zeros_like_3	ZerosLike,policy_1/softmax_cross_entropy_with_logits:1*
T0

Toptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_grad/ExpandDims/dimConst*
valueB :
’’’’’’’’’*
dtype0
¢
Poptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_grad/ExpandDims
ExpandDimsWoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits/Reshape_2_grad/ReshapeToptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_grad/ExpandDims/dim*
T0*

Tdim0
Ł
Ioptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_grad/mulMulPoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_grad/ExpandDims,policy_1/softmax_cross_entropy_with_logits:1*
T0

Poptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_grad/LogSoftmax
LogSoftmax2policy_1/softmax_cross_entropy_with_logits/Reshape*
T0
«
Ioptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_grad/NegNegPoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_grad/LogSoftmax*
T0

Voptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_grad/ExpandDims_1/dimConst*
valueB :
’’’’’’’’’*
dtype0
¦
Roptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_grad/ExpandDims_1
ExpandDimsWoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits/Reshape_2_grad/ReshapeVoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_grad/ExpandDims_1/dim*

Tdim0*
T0
ś
Koptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_grad/mul_1MulRoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_grad/ExpandDims_1Ioptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_grad/Neg*
T0
ų
Voptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_grad/tuple/group_depsNoOpJ^optimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_grad/mulL^optimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_grad/mul_1
õ
^optimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_grad/tuple/control_dependencyIdentityIoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_grad/mulW^optimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_grad/tuple/group_deps*
T0*\
_classR
PNloc:@optimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_grad/mul
ū
`optimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_grad/tuple/control_dependency_1IdentityKoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_grad/mul_1W^optimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_grad/tuple/group_deps*
T0*^
_classT
RPloc:@optimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_grad/mul_1
s
Boptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/ShapeShapeoptimizer/Exp*
T0*
out_type0
m
Doptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/Shape_1Const*
dtype0*
valueB 
µ
Doptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/Shape_2ShapeMoptimizer/gradients_1/optimizer/clip_by_value_1_grad/tuple/control_dependency*
T0*
out_type0
u
Hoptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/zeros/ConstConst*
valueB
 *    *
dtype0
õ
Boptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/zerosFillDoptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/Shape_2Hoptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/zeros/Const*
T0*

index_type0
|
Foptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/LessEqual	LessEqualoptimizer/Expoptimizer/add_4*
T0
ž
Roptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/BroadcastGradientArgsBroadcastGradientArgsBoptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/ShapeDoptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/Shape_1*
T0
±
Coptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/SelectSelectFoptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/LessEqualMoptimizer/gradients_1/optimizer/clip_by_value_1_grad/tuple/control_dependencyBoptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/zeros*
T0

@optimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/SumSumCoptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/SelectRoptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
ģ
Doptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/ReshapeReshape@optimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/SumBoptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/Shape*
Tshape0*
T0
³
Eoptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/Select_1SelectFoptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/LessEqualBoptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/zerosMoptimizer/gradients_1/optimizer/clip_by_value_1_grad/tuple/control_dependency*
T0

Boptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/Sum_1SumEoptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/Select_1Toptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
ņ
Foptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/Reshape_1ReshapeBoptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/Sum_1Doptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/Shape_1*
T0*
Tshape0
å
Moptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/tuple/group_depsNoOpE^optimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/ReshapeG^optimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/Reshape_1
Ł
Uoptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/tuple/control_dependencyIdentityDoptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/ReshapeN^optimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/tuple/group_deps*
T0*W
_classM
KIloc:@optimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/Reshape
ß
Woptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/tuple/control_dependency_1IdentityFoptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/Reshape_1N^optimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/tuple/group_deps*
T0*Y
_classO
MKloc:@optimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/Reshape_1
{
<optimizer/gradients_1/optimizer/SquaredDifference_grad/ShapeShapeoptimizer/extrinsic_returns*
T0*
out_type0
q
>optimizer/gradients_1/optimizer/SquaredDifference_grad/Shape_1Shapeoptimizer/Sum_3*
T0*
out_type0
ģ
Loptimizer/gradients_1/optimizer/SquaredDifference_grad/BroadcastGradientArgsBroadcastGradientArgs<optimizer/gradients_1/optimizer/SquaredDifference_grad/Shape>optimizer/gradients_1/optimizer/SquaredDifference_grad/Shape_1*
T0
²
=optimizer/gradients_1/optimizer/SquaredDifference_grad/scalarConstF^optimizer/gradients_1/optimizer/Maximum_grad/tuple/control_dependency*
dtype0*
valueB
 *   @
Š
:optimizer/gradients_1/optimizer/SquaredDifference_grad/MulMul=optimizer/gradients_1/optimizer/SquaredDifference_grad/scalarEoptimizer/gradients_1/optimizer/Maximum_grad/tuple/control_dependency*
T0
Ą
:optimizer/gradients_1/optimizer/SquaredDifference_grad/subSuboptimizer/extrinsic_returnsoptimizer/Sum_3F^optimizer/gradients_1/optimizer/Maximum_grad/tuple/control_dependency*
T0
Ä
<optimizer/gradients_1/optimizer/SquaredDifference_grad/mul_1Mul:optimizer/gradients_1/optimizer/SquaredDifference_grad/Mul:optimizer/gradients_1/optimizer/SquaredDifference_grad/sub*
T0
ó
:optimizer/gradients_1/optimizer/SquaredDifference_grad/SumSum<optimizer/gradients_1/optimizer/SquaredDifference_grad/mul_1Loptimizer/gradients_1/optimizer/SquaredDifference_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
Ś
>optimizer/gradients_1/optimizer/SquaredDifference_grad/ReshapeReshape:optimizer/gradients_1/optimizer/SquaredDifference_grad/Sum<optimizer/gradients_1/optimizer/SquaredDifference_grad/Shape*
Tshape0*
T0
÷
<optimizer/gradients_1/optimizer/SquaredDifference_grad/Sum_1Sum<optimizer/gradients_1/optimizer/SquaredDifference_grad/mul_1Noptimizer/gradients_1/optimizer/SquaredDifference_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
ą
@optimizer/gradients_1/optimizer/SquaredDifference_grad/Reshape_1Reshape<optimizer/gradients_1/optimizer/SquaredDifference_grad/Sum_1>optimizer/gradients_1/optimizer/SquaredDifference_grad/Shape_1*
T0*
Tshape0

:optimizer/gradients_1/optimizer/SquaredDifference_grad/NegNeg@optimizer/gradients_1/optimizer/SquaredDifference_grad/Reshape_1*
T0
Ķ
Goptimizer/gradients_1/optimizer/SquaredDifference_grad/tuple/group_depsNoOp;^optimizer/gradients_1/optimizer/SquaredDifference_grad/Neg?^optimizer/gradients_1/optimizer/SquaredDifference_grad/Reshape
Į
Ooptimizer/gradients_1/optimizer/SquaredDifference_grad/tuple/control_dependencyIdentity>optimizer/gradients_1/optimizer/SquaredDifference_grad/ReshapeH^optimizer/gradients_1/optimizer/SquaredDifference_grad/tuple/group_deps*
T0*Q
_classG
ECloc:@optimizer/gradients_1/optimizer/SquaredDifference_grad/Reshape
»
Qoptimizer/gradients_1/optimizer/SquaredDifference_grad/tuple/control_dependency_1Identity:optimizer/gradients_1/optimizer/SquaredDifference_grad/NegH^optimizer/gradients_1/optimizer/SquaredDifference_grad/tuple/group_deps*M
_classC
A?loc:@optimizer/gradients_1/optimizer/SquaredDifference_grad/Neg*
T0
}
>optimizer/gradients_1/optimizer/SquaredDifference_1_grad/ShapeShapeoptimizer/extrinsic_returns*
T0*
out_type0
s
@optimizer/gradients_1/optimizer/SquaredDifference_1_grad/Shape_1Shapeoptimizer/add_3*
T0*
out_type0
ņ
Noptimizer/gradients_1/optimizer/SquaredDifference_1_grad/BroadcastGradientArgsBroadcastGradientArgs>optimizer/gradients_1/optimizer/SquaredDifference_1_grad/Shape@optimizer/gradients_1/optimizer/SquaredDifference_1_grad/Shape_1*
T0
¶
?optimizer/gradients_1/optimizer/SquaredDifference_1_grad/scalarConstH^optimizer/gradients_1/optimizer/Maximum_grad/tuple/control_dependency_1*
valueB
 *   @*
dtype0
Ö
<optimizer/gradients_1/optimizer/SquaredDifference_1_grad/MulMul?optimizer/gradients_1/optimizer/SquaredDifference_1_grad/scalarGoptimizer/gradients_1/optimizer/Maximum_grad/tuple/control_dependency_1*
T0
Ä
<optimizer/gradients_1/optimizer/SquaredDifference_1_grad/subSuboptimizer/extrinsic_returnsoptimizer/add_3H^optimizer/gradients_1/optimizer/Maximum_grad/tuple/control_dependency_1*
T0
Ź
>optimizer/gradients_1/optimizer/SquaredDifference_1_grad/mul_1Mul<optimizer/gradients_1/optimizer/SquaredDifference_1_grad/Mul<optimizer/gradients_1/optimizer/SquaredDifference_1_grad/sub*
T0
ł
<optimizer/gradients_1/optimizer/SquaredDifference_1_grad/SumSum>optimizer/gradients_1/optimizer/SquaredDifference_1_grad/mul_1Noptimizer/gradients_1/optimizer/SquaredDifference_1_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
ą
@optimizer/gradients_1/optimizer/SquaredDifference_1_grad/ReshapeReshape<optimizer/gradients_1/optimizer/SquaredDifference_1_grad/Sum>optimizer/gradients_1/optimizer/SquaredDifference_1_grad/Shape*
T0*
Tshape0
ż
>optimizer/gradients_1/optimizer/SquaredDifference_1_grad/Sum_1Sum>optimizer/gradients_1/optimizer/SquaredDifference_1_grad/mul_1Poptimizer/gradients_1/optimizer/SquaredDifference_1_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
ę
Boptimizer/gradients_1/optimizer/SquaredDifference_1_grad/Reshape_1Reshape>optimizer/gradients_1/optimizer/SquaredDifference_1_grad/Sum_1@optimizer/gradients_1/optimizer/SquaredDifference_1_grad/Shape_1*
T0*
Tshape0

<optimizer/gradients_1/optimizer/SquaredDifference_1_grad/NegNegBoptimizer/gradients_1/optimizer/SquaredDifference_1_grad/Reshape_1*
T0
Ó
Ioptimizer/gradients_1/optimizer/SquaredDifference_1_grad/tuple/group_depsNoOp=^optimizer/gradients_1/optimizer/SquaredDifference_1_grad/NegA^optimizer/gradients_1/optimizer/SquaredDifference_1_grad/Reshape
É
Qoptimizer/gradients_1/optimizer/SquaredDifference_1_grad/tuple/control_dependencyIdentity@optimizer/gradients_1/optimizer/SquaredDifference_1_grad/ReshapeJ^optimizer/gradients_1/optimizer/SquaredDifference_1_grad/tuple/group_deps*
T0*S
_classI
GEloc:@optimizer/gradients_1/optimizer/SquaredDifference_1_grad/Reshape
Ć
Soptimizer/gradients_1/optimizer/SquaredDifference_1_grad/tuple/control_dependency_1Identity<optimizer/gradients_1/optimizer/SquaredDifference_1_grad/NegJ^optimizer/gradients_1/optimizer/SquaredDifference_1_grad/tuple/group_deps*
T0*O
_classE
CAloc:@optimizer/gradients_1/optimizer/SquaredDifference_1_grad/Neg

Soptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits/Reshape_grad/ShapeShapepolicy_1/strided_slice_3*
T0*
out_type0
¬
Uoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits/Reshape_grad/ReshapeReshape^optimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_grad/tuple/control_dependencySoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits/Reshape_grad/Shape*
T0*
Tshape0

Uoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits/Reshape_1_grad/ShapeShapepolicy_1/Softmax_1*
T0*
out_type0
²
Woptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits/Reshape_1_grad/ReshapeReshape`optimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_grad/tuple/control_dependency_1Uoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits/Reshape_1_grad/Shape*
T0*
Tshape0

optimizer/gradients_1/AddNAddNCoptimizer/gradients_1/optimizer/mul_1_grad/tuple/control_dependencyUoptimizer/gradients_1/optimizer/clip_by_value_1/Minimum_grad/tuple/control_dependency*
T0*E
_class;
97loc:@optimizer/gradients_1/optimizer/mul_1_grad/Reshape*
N
g
,optimizer/gradients_1/optimizer/Exp_grad/mulMuloptimizer/gradients_1/AddNoptimizer/Exp*
T0
u
0optimizer/gradients_1/optimizer/Sum_3_grad/ShapeShape!optimizer/extrinsic_value/BiasAdd*
T0*
out_type0

/optimizer/gradients_1/optimizer/Sum_3_grad/SizeConst*
dtype0*C
_class9
75loc:@optimizer/gradients_1/optimizer/Sum_3_grad/Shape*
value	B :
×
.optimizer/gradients_1/optimizer/Sum_3_grad/addAdd!optimizer/Sum_3/reduction_indices/optimizer/gradients_1/optimizer/Sum_3_grad/Size*
T0*C
_class9
75loc:@optimizer/gradients_1/optimizer/Sum_3_grad/Shape
é
.optimizer/gradients_1/optimizer/Sum_3_grad/modFloorMod.optimizer/gradients_1/optimizer/Sum_3_grad/add/optimizer/gradients_1/optimizer/Sum_3_grad/Size*
T0*C
_class9
75loc:@optimizer/gradients_1/optimizer/Sum_3_grad/Shape
 
2optimizer/gradients_1/optimizer/Sum_3_grad/Shape_1Const*
dtype0*C
_class9
75loc:@optimizer/gradients_1/optimizer/Sum_3_grad/Shape*
valueB 
„
6optimizer/gradients_1/optimizer/Sum_3_grad/range/startConst*C
_class9
75loc:@optimizer/gradients_1/optimizer/Sum_3_grad/Shape*
value	B : *
dtype0
„
6optimizer/gradients_1/optimizer/Sum_3_grad/range/deltaConst*C
_class9
75loc:@optimizer/gradients_1/optimizer/Sum_3_grad/Shape*
value	B :*
dtype0
«
0optimizer/gradients_1/optimizer/Sum_3_grad/rangeRange6optimizer/gradients_1/optimizer/Sum_3_grad/range/start/optimizer/gradients_1/optimizer/Sum_3_grad/Size6optimizer/gradients_1/optimizer/Sum_3_grad/range/delta*C
_class9
75loc:@optimizer/gradients_1/optimizer/Sum_3_grad/Shape*

Tidx0
¤
5optimizer/gradients_1/optimizer/Sum_3_grad/Fill/valueConst*C
_class9
75loc:@optimizer/gradients_1/optimizer/Sum_3_grad/Shape*
value	B :*
dtype0

/optimizer/gradients_1/optimizer/Sum_3_grad/FillFill2optimizer/gradients_1/optimizer/Sum_3_grad/Shape_15optimizer/gradients_1/optimizer/Sum_3_grad/Fill/value*
T0*C
_class9
75loc:@optimizer/gradients_1/optimizer/Sum_3_grad/Shape*

index_type0
å
8optimizer/gradients_1/optimizer/Sum_3_grad/DynamicStitchDynamicStitch0optimizer/gradients_1/optimizer/Sum_3_grad/range.optimizer/gradients_1/optimizer/Sum_3_grad/mod0optimizer/gradients_1/optimizer/Sum_3_grad/Shape/optimizer/gradients_1/optimizer/Sum_3_grad/Fill*C
_class9
75loc:@optimizer/gradients_1/optimizer/Sum_3_grad/Shape*
N*
T0
£
4optimizer/gradients_1/optimizer/Sum_3_grad/Maximum/yConst*C
_class9
75loc:@optimizer/gradients_1/optimizer/Sum_3_grad/Shape*
value	B :*
dtype0
ū
2optimizer/gradients_1/optimizer/Sum_3_grad/MaximumMaximum8optimizer/gradients_1/optimizer/Sum_3_grad/DynamicStitch4optimizer/gradients_1/optimizer/Sum_3_grad/Maximum/y*
T0*C
_class9
75loc:@optimizer/gradients_1/optimizer/Sum_3_grad/Shape
ó
3optimizer/gradients_1/optimizer/Sum_3_grad/floordivFloorDiv0optimizer/gradients_1/optimizer/Sum_3_grad/Shape2optimizer/gradients_1/optimizer/Sum_3_grad/Maximum*
T0*C
_class9
75loc:@optimizer/gradients_1/optimizer/Sum_3_grad/Shape
į
2optimizer/gradients_1/optimizer/Sum_3_grad/ReshapeReshapeQoptimizer/gradients_1/optimizer/SquaredDifference_grad/tuple/control_dependency_18optimizer/gradients_1/optimizer/Sum_3_grad/DynamicStitch*
T0*
Tshape0
»
/optimizer/gradients_1/optimizer/Sum_3_grad/TileTile2optimizer/gradients_1/optimizer/Sum_3_grad/Reshape3optimizer/gradients_1/optimizer/Sum_3_grad/floordiv*

Tmultiples0*
T0
v
0optimizer/gradients_1/optimizer/add_3_grad/ShapeShape"optimizer/extrinsic_value_estimate*
T0*
out_type0
m
2optimizer/gradients_1/optimizer/add_3_grad/Shape_1Shapeoptimizer/clip_by_value*
T0*
out_type0
Č
@optimizer/gradients_1/optimizer/add_3_grad/BroadcastGradientArgsBroadcastGradientArgs0optimizer/gradients_1/optimizer/add_3_grad/Shape2optimizer/gradients_1/optimizer/add_3_grad/Shape_1*
T0
ņ
.optimizer/gradients_1/optimizer/add_3_grad/SumSumSoptimizer/gradients_1/optimizer/SquaredDifference_1_grad/tuple/control_dependency_1@optimizer/gradients_1/optimizer/add_3_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
¶
2optimizer/gradients_1/optimizer/add_3_grad/ReshapeReshape.optimizer/gradients_1/optimizer/add_3_grad/Sum0optimizer/gradients_1/optimizer/add_3_grad/Shape*
T0*
Tshape0
ö
0optimizer/gradients_1/optimizer/add_3_grad/Sum_1SumSoptimizer/gradients_1/optimizer/SquaredDifference_1_grad/tuple/control_dependency_1Boptimizer/gradients_1/optimizer/add_3_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
¼
4optimizer/gradients_1/optimizer/add_3_grad/Reshape_1Reshape0optimizer/gradients_1/optimizer/add_3_grad/Sum_12optimizer/gradients_1/optimizer/add_3_grad/Shape_1*
T0*
Tshape0
Æ
;optimizer/gradients_1/optimizer/add_3_grad/tuple/group_depsNoOp3^optimizer/gradients_1/optimizer/add_3_grad/Reshape5^optimizer/gradients_1/optimizer/add_3_grad/Reshape_1

Coptimizer/gradients_1/optimizer/add_3_grad/tuple/control_dependencyIdentity2optimizer/gradients_1/optimizer/add_3_grad/Reshape<^optimizer/gradients_1/optimizer/add_3_grad/tuple/group_deps*
T0*E
_class;
97loc:@optimizer/gradients_1/optimizer/add_3_grad/Reshape

Eoptimizer/gradients_1/optimizer/add_3_grad/tuple/control_dependency_1Identity4optimizer/gradients_1/optimizer/add_3_grad/Reshape_1<^optimizer/gradients_1/optimizer/add_3_grad/tuple/group_deps*
T0*G
_class=
;9loc:@optimizer/gradients_1/optimizer/add_3_grad/Reshape_1
n
9optimizer/gradients_1/policy_1/strided_slice_3_grad/ShapeShapepolicy_1/concat_2*
T0*
out_type0
Č
Doptimizer/gradients_1/policy_1/strided_slice_3_grad/StridedSliceGradStridedSliceGrad9optimizer/gradients_1/policy_1/strided_slice_3_grad/Shapepolicy_1/strided_slice_3/stack policy_1/strided_slice_3/stack_1 policy_1/strided_slice_3/stack_2Uoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits/Reshape_grad/Reshape*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
®
1optimizer/gradients_1/policy_1/Softmax_1_grad/mulMulWoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits/Reshape_1_grad/Reshapepolicy_1/Softmax_1*
T0
v
Coptimizer/gradients_1/policy_1/Softmax_1_grad/Sum/reduction_indicesConst*
valueB :
’’’’’’’’’*
dtype0
Ö
1optimizer/gradients_1/policy_1/Softmax_1_grad/SumSum1optimizer/gradients_1/policy_1/Softmax_1_grad/mulCoptimizer/gradients_1/policy_1/Softmax_1_grad/Sum/reduction_indices*
T0*

Tidx0*
	keep_dims(
Ķ
1optimizer/gradients_1/policy_1/Softmax_1_grad/subSubWoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits/Reshape_1_grad/Reshape1optimizer/gradients_1/policy_1/Softmax_1_grad/Sum*
T0

3optimizer/gradients_1/policy_1/Softmax_1_grad/mul_1Mul1optimizer/gradients_1/policy_1/Softmax_1_grad/subpolicy_1/Softmax_1*
T0
b
0optimizer/gradients_1/optimizer/sub_1_grad/ShapeShapepolicy_1/Sum_2*
T0*
out_type0
e
2optimizer/gradients_1/optimizer/sub_1_grad/Shape_1Shapeoptimizer/Sum_1*
T0*
out_type0
Č
@optimizer/gradients_1/optimizer/sub_1_grad/BroadcastGradientArgsBroadcastGradientArgs0optimizer/gradients_1/optimizer/sub_1_grad/Shape2optimizer/gradients_1/optimizer/sub_1_grad/Shape_1*
T0
Ė
.optimizer/gradients_1/optimizer/sub_1_grad/SumSum,optimizer/gradients_1/optimizer/Exp_grad/mul@optimizer/gradients_1/optimizer/sub_1_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
¶
2optimizer/gradients_1/optimizer/sub_1_grad/ReshapeReshape.optimizer/gradients_1/optimizer/sub_1_grad/Sum0optimizer/gradients_1/optimizer/sub_1_grad/Shape*
Tshape0*
T0
Ļ
0optimizer/gradients_1/optimizer/sub_1_grad/Sum_1Sum,optimizer/gradients_1/optimizer/Exp_grad/mulBoptimizer/gradients_1/optimizer/sub_1_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
p
.optimizer/gradients_1/optimizer/sub_1_grad/NegNeg0optimizer/gradients_1/optimizer/sub_1_grad/Sum_1*
T0
ŗ
4optimizer/gradients_1/optimizer/sub_1_grad/Reshape_1Reshape.optimizer/gradients_1/optimizer/sub_1_grad/Neg2optimizer/gradients_1/optimizer/sub_1_grad/Shape_1*
T0*
Tshape0
Æ
;optimizer/gradients_1/optimizer/sub_1_grad/tuple/group_depsNoOp3^optimizer/gradients_1/optimizer/sub_1_grad/Reshape5^optimizer/gradients_1/optimizer/sub_1_grad/Reshape_1

Coptimizer/gradients_1/optimizer/sub_1_grad/tuple/control_dependencyIdentity2optimizer/gradients_1/optimizer/sub_1_grad/Reshape<^optimizer/gradients_1/optimizer/sub_1_grad/tuple/group_deps*
T0*E
_class;
97loc:@optimizer/gradients_1/optimizer/sub_1_grad/Reshape

Eoptimizer/gradients_1/optimizer/sub_1_grad/tuple/control_dependency_1Identity4optimizer/gradients_1/optimizer/sub_1_grad/Reshape_1<^optimizer/gradients_1/optimizer/sub_1_grad/tuple/group_deps*
T0*G
_class=
;9loc:@optimizer/gradients_1/optimizer/sub_1_grad/Reshape_1
{
8optimizer/gradients_1/optimizer/clip_by_value_grad/ShapeShapeoptimizer/clip_by_value/Minimum*
T0*
out_type0
c
:optimizer/gradients_1/optimizer/clip_by_value_grad/Shape_1Const*
valueB *
dtype0
£
:optimizer/gradients_1/optimizer/clip_by_value_grad/Shape_2ShapeEoptimizer/gradients_1/optimizer/add_3_grad/tuple/control_dependency_1*
T0*
out_type0
k
>optimizer/gradients_1/optimizer/clip_by_value_grad/zeros/ConstConst*
dtype0*
valueB
 *    
×
8optimizer/gradients_1/optimizer/clip_by_value_grad/zerosFill:optimizer/gradients_1/optimizer/clip_by_value_grad/Shape_2>optimizer/gradients_1/optimizer/clip_by_value_grad/zeros/Const*
T0*

index_type0

?optimizer/gradients_1/optimizer/clip_by_value_grad/GreaterEqualGreaterEqualoptimizer/clip_by_value/Minimumoptimizer/Neg_1*
T0
ą
Hoptimizer/gradients_1/optimizer/clip_by_value_grad/BroadcastGradientArgsBroadcastGradientArgs8optimizer/gradients_1/optimizer/clip_by_value_grad/Shape:optimizer/gradients_1/optimizer/clip_by_value_grad/Shape_1*
T0

9optimizer/gradients_1/optimizer/clip_by_value_grad/SelectSelect?optimizer/gradients_1/optimizer/clip_by_value_grad/GreaterEqualEoptimizer/gradients_1/optimizer/add_3_grad/tuple/control_dependency_18optimizer/gradients_1/optimizer/clip_by_value_grad/zeros*
T0
č
6optimizer/gradients_1/optimizer/clip_by_value_grad/SumSum9optimizer/gradients_1/optimizer/clip_by_value_grad/SelectHoptimizer/gradients_1/optimizer/clip_by_value_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
Ī
:optimizer/gradients_1/optimizer/clip_by_value_grad/ReshapeReshape6optimizer/gradients_1/optimizer/clip_by_value_grad/Sum8optimizer/gradients_1/optimizer/clip_by_value_grad/Shape*
Tshape0*
T0

;optimizer/gradients_1/optimizer/clip_by_value_grad/Select_1Select?optimizer/gradients_1/optimizer/clip_by_value_grad/GreaterEqual8optimizer/gradients_1/optimizer/clip_by_value_grad/zerosEoptimizer/gradients_1/optimizer/add_3_grad/tuple/control_dependency_1*
T0
ī
8optimizer/gradients_1/optimizer/clip_by_value_grad/Sum_1Sum;optimizer/gradients_1/optimizer/clip_by_value_grad/Select_1Joptimizer/gradients_1/optimizer/clip_by_value_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
Ō
<optimizer/gradients_1/optimizer/clip_by_value_grad/Reshape_1Reshape8optimizer/gradients_1/optimizer/clip_by_value_grad/Sum_1:optimizer/gradients_1/optimizer/clip_by_value_grad/Shape_1*
T0*
Tshape0
Ē
Coptimizer/gradients_1/optimizer/clip_by_value_grad/tuple/group_depsNoOp;^optimizer/gradients_1/optimizer/clip_by_value_grad/Reshape=^optimizer/gradients_1/optimizer/clip_by_value_grad/Reshape_1
±
Koptimizer/gradients_1/optimizer/clip_by_value_grad/tuple/control_dependencyIdentity:optimizer/gradients_1/optimizer/clip_by_value_grad/ReshapeD^optimizer/gradients_1/optimizer/clip_by_value_grad/tuple/group_deps*
T0*M
_classC
A?loc:@optimizer/gradients_1/optimizer/clip_by_value_grad/Reshape
·
Moptimizer/gradients_1/optimizer/clip_by_value_grad/tuple/control_dependency_1Identity<optimizer/gradients_1/optimizer/clip_by_value_grad/Reshape_1D^optimizer/gradients_1/optimizer/clip_by_value_grad/tuple/group_deps*
T0*O
_classE
CAloc:@optimizer/gradients_1/optimizer/clip_by_value_grad/Reshape_1
n
9optimizer/gradients_1/policy_1/strided_slice_2_grad/ShapeShapepolicy_1/concat_2*
T0*
out_type0
¦
Doptimizer/gradients_1/policy_1/strided_slice_2_grad/StridedSliceGradStridedSliceGrad9optimizer/gradients_1/policy_1/strided_slice_2_grad/Shapepolicy_1/strided_slice_2/stack policy_1/strided_slice_2/stack_1 policy_1/strided_slice_2/stack_23optimizer/gradients_1/policy_1/Softmax_1_grad/mul_1*
T0*
Index0*
shrink_axis_mask *
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask
c
/optimizer/gradients_1/policy_1/Sum_2_grad/ShapeShapepolicy_1/stack_1*
T0*
out_type0

.optimizer/gradients_1/policy_1/Sum_2_grad/SizeConst*B
_class8
64loc:@optimizer/gradients_1/policy_1/Sum_2_grad/Shape*
value	B :*
dtype0
Ó
-optimizer/gradients_1/policy_1/Sum_2_grad/addAdd policy_1/Sum_2/reduction_indices.optimizer/gradients_1/policy_1/Sum_2_grad/Size*B
_class8
64loc:@optimizer/gradients_1/policy_1/Sum_2_grad/Shape*
T0
å
-optimizer/gradients_1/policy_1/Sum_2_grad/modFloorMod-optimizer/gradients_1/policy_1/Sum_2_grad/add.optimizer/gradients_1/policy_1/Sum_2_grad/Size*
T0*B
_class8
64loc:@optimizer/gradients_1/policy_1/Sum_2_grad/Shape

1optimizer/gradients_1/policy_1/Sum_2_grad/Shape_1Const*B
_class8
64loc:@optimizer/gradients_1/policy_1/Sum_2_grad/Shape*
valueB *
dtype0
£
5optimizer/gradients_1/policy_1/Sum_2_grad/range/startConst*B
_class8
64loc:@optimizer/gradients_1/policy_1/Sum_2_grad/Shape*
value	B : *
dtype0
£
5optimizer/gradients_1/policy_1/Sum_2_grad/range/deltaConst*B
_class8
64loc:@optimizer/gradients_1/policy_1/Sum_2_grad/Shape*
value	B :*
dtype0
¦
/optimizer/gradients_1/policy_1/Sum_2_grad/rangeRange5optimizer/gradients_1/policy_1/Sum_2_grad/range/start.optimizer/gradients_1/policy_1/Sum_2_grad/Size5optimizer/gradients_1/policy_1/Sum_2_grad/range/delta*B
_class8
64loc:@optimizer/gradients_1/policy_1/Sum_2_grad/Shape*

Tidx0
¢
4optimizer/gradients_1/policy_1/Sum_2_grad/Fill/valueConst*B
_class8
64loc:@optimizer/gradients_1/policy_1/Sum_2_grad/Shape*
value	B :*
dtype0
ž
.optimizer/gradients_1/policy_1/Sum_2_grad/FillFill1optimizer/gradients_1/policy_1/Sum_2_grad/Shape_14optimizer/gradients_1/policy_1/Sum_2_grad/Fill/value*
T0*B
_class8
64loc:@optimizer/gradients_1/policy_1/Sum_2_grad/Shape*

index_type0
ß
7optimizer/gradients_1/policy_1/Sum_2_grad/DynamicStitchDynamicStitch/optimizer/gradients_1/policy_1/Sum_2_grad/range-optimizer/gradients_1/policy_1/Sum_2_grad/mod/optimizer/gradients_1/policy_1/Sum_2_grad/Shape.optimizer/gradients_1/policy_1/Sum_2_grad/Fill*B
_class8
64loc:@optimizer/gradients_1/policy_1/Sum_2_grad/Shape*
N*
T0
”
3optimizer/gradients_1/policy_1/Sum_2_grad/Maximum/yConst*B
_class8
64loc:@optimizer/gradients_1/policy_1/Sum_2_grad/Shape*
value	B :*
dtype0
÷
1optimizer/gradients_1/policy_1/Sum_2_grad/MaximumMaximum7optimizer/gradients_1/policy_1/Sum_2_grad/DynamicStitch3optimizer/gradients_1/policy_1/Sum_2_grad/Maximum/y*
T0*B
_class8
64loc:@optimizer/gradients_1/policy_1/Sum_2_grad/Shape
ļ
2optimizer/gradients_1/policy_1/Sum_2_grad/floordivFloorDiv/optimizer/gradients_1/policy_1/Sum_2_grad/Shape1optimizer/gradients_1/policy_1/Sum_2_grad/Maximum*
T0*B
_class8
64loc:@optimizer/gradients_1/policy_1/Sum_2_grad/Shape
Ń
1optimizer/gradients_1/policy_1/Sum_2_grad/ReshapeReshapeCoptimizer/gradients_1/optimizer/sub_1_grad/tuple/control_dependency7optimizer/gradients_1/policy_1/Sum_2_grad/DynamicStitch*
T0*
Tshape0
ø
.optimizer/gradients_1/policy_1/Sum_2_grad/TileTile1optimizer/gradients_1/policy_1/Sum_2_grad/Reshape2optimizer/gradients_1/policy_1/Sum_2_grad/floordiv*

Tmultiples0*
T0
q
@optimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/ShapeShapeoptimizer/sub*
T0*
out_type0
k
Boptimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/Shape_1Const*
valueB *
dtype0
±
Boptimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/Shape_2ShapeKoptimizer/gradients_1/optimizer/clip_by_value_grad/tuple/control_dependency*
T0*
out_type0
s
Foptimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/zeros/ConstConst*
valueB
 *    *
dtype0
ļ
@optimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/zerosFillBoptimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/Shape_2Foptimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/zeros/Const*
T0*

index_type0

Doptimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/LessEqual	LessEqualoptimizer/suboptimizer/PolynomialDecay_1*
T0
ų
Poptimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/BroadcastGradientArgsBroadcastGradientArgs@optimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/ShapeBoptimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/Shape_1*
T0
©
Aoptimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/SelectSelectDoptimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/LessEqualKoptimizer/gradients_1/optimizer/clip_by_value_grad/tuple/control_dependency@optimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/zeros*
T0

>optimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/SumSumAoptimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/SelectPoptimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
ę
Boptimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/ReshapeReshape>optimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/Sum@optimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/Shape*
T0*
Tshape0
«
Coptimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/Select_1SelectDoptimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/LessEqual@optimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/zerosKoptimizer/gradients_1/optimizer/clip_by_value_grad/tuple/control_dependency*
T0

@optimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/Sum_1SumCoptimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/Select_1Roptimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
ģ
Doptimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/Reshape_1Reshape@optimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/Sum_1Boptimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/Shape_1*
T0*
Tshape0
ß
Koptimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/tuple/group_depsNoOpC^optimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/ReshapeE^optimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/Reshape_1
Ń
Soptimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/tuple/control_dependencyIdentityBoptimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/ReshapeL^optimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/tuple/group_deps*
T0*U
_classK
IGloc:@optimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/Reshape
×
Uoptimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/tuple/control_dependency_1IdentityDoptimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/Reshape_1L^optimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/tuple/group_deps*
T0*W
_classM
KIloc:@optimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/Reshape_1

3optimizer/gradients_1/policy_1/stack_1_grad/unstackUnpack.optimizer/gradients_1/policy_1/Sum_2_grad/Tile*
T0*	
num*

axis
a
.optimizer/gradients_1/optimizer/sub_grad/ShapeShapeoptimizer/Sum_2*
T0*
out_type0
v
0optimizer/gradients_1/optimizer/sub_grad/Shape_1Shape"optimizer/extrinsic_value_estimate*
T0*
out_type0
Ā
>optimizer/gradients_1/optimizer/sub_grad/BroadcastGradientArgsBroadcastGradientArgs.optimizer/gradients_1/optimizer/sub_grad/Shape0optimizer/gradients_1/optimizer/sub_grad/Shape_1*
T0
ī
,optimizer/gradients_1/optimizer/sub_grad/SumSumSoptimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/tuple/control_dependency>optimizer/gradients_1/optimizer/sub_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
°
0optimizer/gradients_1/optimizer/sub_grad/ReshapeReshape,optimizer/gradients_1/optimizer/sub_grad/Sum.optimizer/gradients_1/optimizer/sub_grad/Shape*
T0*
Tshape0
ņ
.optimizer/gradients_1/optimizer/sub_grad/Sum_1SumSoptimizer/gradients_1/optimizer/clip_by_value/Minimum_grad/tuple/control_dependency@optimizer/gradients_1/optimizer/sub_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
l
,optimizer/gradients_1/optimizer/sub_grad/NegNeg.optimizer/gradients_1/optimizer/sub_grad/Sum_1*
T0
“
2optimizer/gradients_1/optimizer/sub_grad/Reshape_1Reshape,optimizer/gradients_1/optimizer/sub_grad/Neg0optimizer/gradients_1/optimizer/sub_grad/Shape_1*
T0*
Tshape0
©
9optimizer/gradients_1/optimizer/sub_grad/tuple/group_depsNoOp1^optimizer/gradients_1/optimizer/sub_grad/Reshape3^optimizer/gradients_1/optimizer/sub_grad/Reshape_1

Aoptimizer/gradients_1/optimizer/sub_grad/tuple/control_dependencyIdentity0optimizer/gradients_1/optimizer/sub_grad/Reshape:^optimizer/gradients_1/optimizer/sub_grad/tuple/group_deps*
T0*C
_class9
75loc:@optimizer/gradients_1/optimizer/sub_grad/Reshape

Coptimizer/gradients_1/optimizer/sub_grad/tuple/control_dependency_1Identity2optimizer/gradients_1/optimizer/sub_grad/Reshape_1:^optimizer/gradients_1/optimizer/sub_grad/tuple/group_deps*
T0*E
_class;
97loc:@optimizer/gradients_1/optimizer/sub_grad/Reshape_1
p
+optimizer/gradients_1/policy_1/Neg_grad/NegNeg3optimizer/gradients_1/policy_1/stack_1_grad/unstack*
T0
u
0optimizer/gradients_1/optimizer/Sum_2_grad/ShapeShape!optimizer/extrinsic_value/BiasAdd*
T0*
out_type0

/optimizer/gradients_1/optimizer/Sum_2_grad/SizeConst*
dtype0*C
_class9
75loc:@optimizer/gradients_1/optimizer/Sum_2_grad/Shape*
value	B :
×
.optimizer/gradients_1/optimizer/Sum_2_grad/addAdd!optimizer/Sum_2/reduction_indices/optimizer/gradients_1/optimizer/Sum_2_grad/Size*
T0*C
_class9
75loc:@optimizer/gradients_1/optimizer/Sum_2_grad/Shape
é
.optimizer/gradients_1/optimizer/Sum_2_grad/modFloorMod.optimizer/gradients_1/optimizer/Sum_2_grad/add/optimizer/gradients_1/optimizer/Sum_2_grad/Size*
T0*C
_class9
75loc:@optimizer/gradients_1/optimizer/Sum_2_grad/Shape
 
2optimizer/gradients_1/optimizer/Sum_2_grad/Shape_1Const*C
_class9
75loc:@optimizer/gradients_1/optimizer/Sum_2_grad/Shape*
valueB *
dtype0
„
6optimizer/gradients_1/optimizer/Sum_2_grad/range/startConst*C
_class9
75loc:@optimizer/gradients_1/optimizer/Sum_2_grad/Shape*
value	B : *
dtype0
„
6optimizer/gradients_1/optimizer/Sum_2_grad/range/deltaConst*C
_class9
75loc:@optimizer/gradients_1/optimizer/Sum_2_grad/Shape*
value	B :*
dtype0
«
0optimizer/gradients_1/optimizer/Sum_2_grad/rangeRange6optimizer/gradients_1/optimizer/Sum_2_grad/range/start/optimizer/gradients_1/optimizer/Sum_2_grad/Size6optimizer/gradients_1/optimizer/Sum_2_grad/range/delta*

Tidx0*C
_class9
75loc:@optimizer/gradients_1/optimizer/Sum_2_grad/Shape
¤
5optimizer/gradients_1/optimizer/Sum_2_grad/Fill/valueConst*C
_class9
75loc:@optimizer/gradients_1/optimizer/Sum_2_grad/Shape*
value	B :*
dtype0

/optimizer/gradients_1/optimizer/Sum_2_grad/FillFill2optimizer/gradients_1/optimizer/Sum_2_grad/Shape_15optimizer/gradients_1/optimizer/Sum_2_grad/Fill/value*
T0*C
_class9
75loc:@optimizer/gradients_1/optimizer/Sum_2_grad/Shape*

index_type0
å
8optimizer/gradients_1/optimizer/Sum_2_grad/DynamicStitchDynamicStitch0optimizer/gradients_1/optimizer/Sum_2_grad/range.optimizer/gradients_1/optimizer/Sum_2_grad/mod0optimizer/gradients_1/optimizer/Sum_2_grad/Shape/optimizer/gradients_1/optimizer/Sum_2_grad/Fill*
N*
T0*C
_class9
75loc:@optimizer/gradients_1/optimizer/Sum_2_grad/Shape
£
4optimizer/gradients_1/optimizer/Sum_2_grad/Maximum/yConst*C
_class9
75loc:@optimizer/gradients_1/optimizer/Sum_2_grad/Shape*
value	B :*
dtype0
ū
2optimizer/gradients_1/optimizer/Sum_2_grad/MaximumMaximum8optimizer/gradients_1/optimizer/Sum_2_grad/DynamicStitch4optimizer/gradients_1/optimizer/Sum_2_grad/Maximum/y*
T0*C
_class9
75loc:@optimizer/gradients_1/optimizer/Sum_2_grad/Shape
ó
3optimizer/gradients_1/optimizer/Sum_2_grad/floordivFloorDiv0optimizer/gradients_1/optimizer/Sum_2_grad/Shape2optimizer/gradients_1/optimizer/Sum_2_grad/Maximum*
T0*C
_class9
75loc:@optimizer/gradients_1/optimizer/Sum_2_grad/Shape
Ń
2optimizer/gradients_1/optimizer/Sum_2_grad/ReshapeReshapeAoptimizer/gradients_1/optimizer/sub_grad/tuple/control_dependency8optimizer/gradients_1/optimizer/Sum_2_grad/DynamicStitch*
T0*
Tshape0
»
/optimizer/gradients_1/optimizer/Sum_2_grad/TileTile2optimizer/gradients_1/optimizer/Sum_2_grad/Reshape3optimizer/gradients_1/optimizer/Sum_2_grad/floordiv*

Tmultiples0*
T0
§
Woptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1/Reshape_2_grad/ShapeShape,policy_1/softmax_cross_entropy_with_logits_1*
T0*
out_type0

Yoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1/Reshape_2_grad/ReshapeReshape+optimizer/gradients_1/policy_1/Neg_grad/NegWoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1/Reshape_2_grad/Shape*
T0*
Tshape0
Ü
optimizer/gradients_1/AddN_1AddN/optimizer/gradients_1/optimizer/Sum_3_grad/Tile/optimizer/gradients_1/optimizer/Sum_2_grad/Tile*
T0*B
_class8
64loc:@optimizer/gradients_1/optimizer/Sum_3_grad/Tile*
N

Hoptimizer/gradients_1/optimizer/extrinsic_value/BiasAdd_grad/BiasAddGradBiasAddGradoptimizer/gradients_1/AddN_1*
T0*
data_formatNHWC
æ
Moptimizer/gradients_1/optimizer/extrinsic_value/BiasAdd_grad/tuple/group_depsNoOp^optimizer/gradients_1/AddN_1I^optimizer/gradients_1/optimizer/extrinsic_value/BiasAdd_grad/BiasAddGrad

Uoptimizer/gradients_1/optimizer/extrinsic_value/BiasAdd_grad/tuple/control_dependencyIdentityoptimizer/gradients_1/AddN_1N^optimizer/gradients_1/optimizer/extrinsic_value/BiasAdd_grad/tuple/group_deps*
T0*B
_class8
64loc:@optimizer/gradients_1/optimizer/Sum_3_grad/Tile
ć
Woptimizer/gradients_1/optimizer/extrinsic_value/BiasAdd_grad/tuple/control_dependency_1IdentityHoptimizer/gradients_1/optimizer/extrinsic_value/BiasAdd_grad/BiasAddGradN^optimizer/gradients_1/optimizer/extrinsic_value/BiasAdd_grad/tuple/group_deps*
T0*[
_classQ
OMloc:@optimizer/gradients_1/optimizer/extrinsic_value/BiasAdd_grad/BiasAddGrad
h
"optimizer/gradients_1/zeros_like_4	ZerosLike.policy_1/softmax_cross_entropy_with_logits_1:1*
T0

Voptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims/dimConst*
valueB :
’’’’’’’’’*
dtype0
Ø
Roptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims
ExpandDimsYoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1/Reshape_2_grad/ReshapeVoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims/dim*
T0*

Tdim0
ß
Koptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1_grad/mulMulRoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims.policy_1/softmax_cross_entropy_with_logits_1:1*
T0

Roptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1_grad/LogSoftmax
LogSoftmax4policy_1/softmax_cross_entropy_with_logits_1/Reshape*
T0
Æ
Koptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1_grad/NegNegRoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1_grad/LogSoftmax*
T0

Xoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims_1/dimConst*
valueB :
’’’’’’’’’*
dtype0
¬
Toptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims_1
ExpandDimsYoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1/Reshape_2_grad/ReshapeXoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims_1/dim*
T0*

Tdim0

Moptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1_grad/mul_1MulToptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims_1Koptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1_grad/Neg*
T0
ž
Xoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1_grad/tuple/group_depsNoOpL^optimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1_grad/mulN^optimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1_grad/mul_1
ż
`optimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1_grad/tuple/control_dependencyIdentityKoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1_grad/mulY^optimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1_grad/tuple/group_deps*
T0*^
_classT
RPloc:@optimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1_grad/mul

boptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1_grad/tuple/control_dependency_1IdentityMoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1_grad/mul_1Y^optimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1_grad/tuple/group_deps*
T0*`
_classV
TRloc:@optimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1_grad/mul_1
ś
Boptimizer/gradients_1/optimizer/extrinsic_value/MatMul_grad/MatMulMatMulUoptimizer/gradients_1/optimizer/extrinsic_value/BiasAdd_grad/tuple/control_dependency&optimizer//extrinsic_value/kernel/read*
T0*
transpose_a( *
transpose_b(
ę
Doptimizer/gradients_1/optimizer/extrinsic_value/MatMul_grad/MatMul_1MatMuloptimizer/concatUoptimizer/gradients_1/optimizer/extrinsic_value/BiasAdd_grad/tuple/control_dependency*
transpose_a(*
transpose_b( *
T0
ą
Loptimizer/gradients_1/optimizer/extrinsic_value/MatMul_grad/tuple/group_depsNoOpC^optimizer/gradients_1/optimizer/extrinsic_value/MatMul_grad/MatMulE^optimizer/gradients_1/optimizer/extrinsic_value/MatMul_grad/MatMul_1
Ó
Toptimizer/gradients_1/optimizer/extrinsic_value/MatMul_grad/tuple/control_dependencyIdentityBoptimizer/gradients_1/optimizer/extrinsic_value/MatMul_grad/MatMulM^optimizer/gradients_1/optimizer/extrinsic_value/MatMul_grad/tuple/group_deps*
T0*U
_classK
IGloc:@optimizer/gradients_1/optimizer/extrinsic_value/MatMul_grad/MatMul
Ł
Voptimizer/gradients_1/optimizer/extrinsic_value/MatMul_grad/tuple/control_dependency_1IdentityDoptimizer/gradients_1/optimizer/extrinsic_value/MatMul_grad/MatMul_1M^optimizer/gradients_1/optimizer/extrinsic_value/MatMul_grad/tuple/group_deps*W
_classM
KIloc:@optimizer/gradients_1/optimizer/extrinsic_value/MatMul_grad/MatMul_1*
T0

Uoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1/Reshape_grad/ShapeShapepolicy_1/strided_slice_5*
T0*
out_type0
²
Woptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1/Reshape_grad/ReshapeReshape`optimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1_grad/tuple/control_dependencyUoptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1/Reshape_grad/Shape*
T0*
Tshape0
n
9optimizer/gradients_1/policy_1/strided_slice_5_grad/ShapeShapepolicy_1/concat_2*
out_type0*
T0
Ź
Doptimizer/gradients_1/policy_1/strided_slice_5_grad/StridedSliceGradStridedSliceGrad9optimizer/gradients_1/policy_1/strided_slice_5_grad/Shapepolicy_1/strided_slice_5/stack policy_1/strided_slice_5/stack_1 policy_1/strided_slice_5/stack_2Woptimizer/gradients_1/policy_1/softmax_cross_entropy_with_logits_1/Reshape_grad/Reshape*
end_mask*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask 
é
qoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/ShapeShapeToptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd*
T0*
out_type0
ė
soptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Shape_1ShapeToptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Sigmoid*
T0*
out_type0

optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsqoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Shapesoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Shape_1*
T0
«
ooptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/MulMulToptimizer/gradients_1/optimizer/extrinsic_value/MatMul_grad/tuple/control_dependencyToptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Sigmoid*
T0

ooptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/SumSumooptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Muloptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
ł
soptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/ReshapeReshapeooptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Sumqoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Shape*
T0*
Tshape0
­
qoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Mul_1MulToptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAddToptimizer/gradients_1/optimizer/extrinsic_value/MatMul_grad/tuple/control_dependency*
T0

qoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Sum_1Sumqoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Mul_1optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
’
uoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape_1Reshapeqoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Sum_1soptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Shape_1*
T0*
Tshape0
ņ
|optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/tuple/group_depsNoOpt^optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshapev^optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape_1

optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/tuple/control_dependencyIdentitysoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape}^optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/tuple/group_deps*
T0*
_class|
zxloc:@optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape

optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/tuple/control_dependency_1Identityuoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape_1}^optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/tuple/group_deps*
T0*
_class~
|zloc:@optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape_1
į
optimizer/gradients_1/AddN_2AddNDoptimizer/gradients_1/policy_1/strided_slice_3_grad/StridedSliceGradDoptimizer/gradients_1/policy_1/strided_slice_2_grad/StridedSliceGradDoptimizer/gradients_1/policy_1/strided_slice_5_grad/StridedSliceGrad*
T0*W
_classM
KIloc:@optimizer/gradients_1/policy_1/strided_slice_3_grad/StridedSliceGrad*
N
ņ
{optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Sigmoid_grad/SigmoidGradSigmoidGradToptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Sigmoidoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/tuple/control_dependency_1*
T0
z
4optimizer/gradients_1/policy_1/Log_1_grad/Reciprocal
Reciprocalpolicy_1/add_2^optimizer/gradients_1/AddN_2*
T0

-optimizer/gradients_1/policy_1/Log_1_grad/mulMuloptimizer/gradients_1/AddN_24optimizer/gradients_1/policy_1/Log_1_grad/Reciprocal*
T0
Ć
optimizer/gradients_1/AddN_3AddNoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/tuple/control_dependency{optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Sigmoid_grad/SigmoidGrad*
T0*
_class|
zxloc:@optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape*
N
Č
{optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/BiasAddGradBiasAddGradoptimizer/gradients_1/AddN_3*
T0*
data_formatNHWC
¦
optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/group_depsNoOp^optimizer/gradients_1/AddN_3|^optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/BiasAddGrad
É
optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/control_dependencyIdentityoptimizer/gradients_1/AddN_3^optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*
_class|
zxloc:@optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape
µ
optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/control_dependency_1Identity{optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/BiasAddGrad^optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*
_class
loc:@optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/BiasAddGrad
c
/optimizer/gradients_1/policy_1/add_2_grad/ShapeShapepolicy_1/truediv*
T0*
out_type0
Z
1optimizer/gradients_1/policy_1/add_2_grad/Shape_1Const*
valueB *
dtype0
Å
?optimizer/gradients_1/policy_1/add_2_grad/BroadcastGradientArgsBroadcastGradientArgs/optimizer/gradients_1/policy_1/add_2_grad/Shape1optimizer/gradients_1/policy_1/add_2_grad/Shape_1*
T0
Ź
-optimizer/gradients_1/policy_1/add_2_grad/SumSum-optimizer/gradients_1/policy_1/Log_1_grad/mul?optimizer/gradients_1/policy_1/add_2_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
³
1optimizer/gradients_1/policy_1/add_2_grad/ReshapeReshape-optimizer/gradients_1/policy_1/add_2_grad/Sum/optimizer/gradients_1/policy_1/add_2_grad/Shape*
T0*
Tshape0
Ī
/optimizer/gradients_1/policy_1/add_2_grad/Sum_1Sum-optimizer/gradients_1/policy_1/Log_1_grad/mulAoptimizer/gradients_1/policy_1/add_2_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
¹
3optimizer/gradients_1/policy_1/add_2_grad/Reshape_1Reshape/optimizer/gradients_1/policy_1/add_2_grad/Sum_11optimizer/gradients_1/policy_1/add_2_grad/Shape_1*
T0*
Tshape0
¬
:optimizer/gradients_1/policy_1/add_2_grad/tuple/group_depsNoOp2^optimizer/gradients_1/policy_1/add_2_grad/Reshape4^optimizer/gradients_1/policy_1/add_2_grad/Reshape_1

Boptimizer/gradients_1/policy_1/add_2_grad/tuple/control_dependencyIdentity1optimizer/gradients_1/policy_1/add_2_grad/Reshape;^optimizer/gradients_1/policy_1/add_2_grad/tuple/group_deps*
T0*D
_class:
86loc:@optimizer/gradients_1/policy_1/add_2_grad/Reshape

Doptimizer/gradients_1/policy_1/add_2_grad/tuple/control_dependency_1Identity3optimizer/gradients_1/policy_1/add_2_grad/Reshape_1;^optimizer/gradients_1/policy_1/add_2_grad/tuple/group_deps*
T0*F
_class<
:8loc:@optimizer/gradients_1/policy_1/add_2_grad/Reshape_1

uoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMulMatMuloptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/control_dependencyYoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/read*
transpose_a( *
transpose_b(*
T0

woptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMul_1MatMulPoptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Muloptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/control_dependency*
T0*
transpose_a(*
transpose_b( 
ł
optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/group_depsNoOpv^optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMulx^optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMul_1
¢
optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/control_dependencyIdentityuoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMul^optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/group_deps*
T0*
_class~
|zloc:@optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMul
©
optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/control_dependency_1Identitywoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMul_1^optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/group_deps*
T0*
_class
~|loc:@optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMul_1
a
1optimizer/gradients_1/policy_1/truediv_grad/ShapeShapepolicy_1/Mul*
T0*
out_type0
c
3optimizer/gradients_1/policy_1/truediv_grad/Shape_1Shapepolicy_1/Sum*
out_type0*
T0
Ė
Aoptimizer/gradients_1/policy_1/truediv_grad/BroadcastGradientArgsBroadcastGradientArgs1optimizer/gradients_1/policy_1/truediv_grad/Shape3optimizer/gradients_1/policy_1/truediv_grad/Shape_1*
T0

3optimizer/gradients_1/policy_1/truediv_grad/RealDivRealDivBoptimizer/gradients_1/policy_1/add_2_grad/tuple/control_dependencypolicy_1/Sum*
T0
Ō
/optimizer/gradients_1/policy_1/truediv_grad/SumSum3optimizer/gradients_1/policy_1/truediv_grad/RealDivAoptimizer/gradients_1/policy_1/truediv_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
¹
3optimizer/gradients_1/policy_1/truediv_grad/ReshapeReshape/optimizer/gradients_1/policy_1/truediv_grad/Sum1optimizer/gradients_1/policy_1/truediv_grad/Shape*
T0*
Tshape0
M
/optimizer/gradients_1/policy_1/truediv_grad/NegNegpolicy_1/Mul*
T0

5optimizer/gradients_1/policy_1/truediv_grad/RealDiv_1RealDiv/optimizer/gradients_1/policy_1/truediv_grad/Negpolicy_1/Sum*
T0

5optimizer/gradients_1/policy_1/truediv_grad/RealDiv_2RealDiv5optimizer/gradients_1/policy_1/truediv_grad/RealDiv_1policy_1/Sum*
T0
ŗ
/optimizer/gradients_1/policy_1/truediv_grad/mulMulBoptimizer/gradients_1/policy_1/add_2_grad/tuple/control_dependency5optimizer/gradients_1/policy_1/truediv_grad/RealDiv_2*
T0
Ō
1optimizer/gradients_1/policy_1/truediv_grad/Sum_1Sum/optimizer/gradients_1/policy_1/truediv_grad/mulCoptimizer/gradients_1/policy_1/truediv_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
æ
5optimizer/gradients_1/policy_1/truediv_grad/Reshape_1Reshape1optimizer/gradients_1/policy_1/truediv_grad/Sum_13optimizer/gradients_1/policy_1/truediv_grad/Shape_1*
T0*
Tshape0
²
<optimizer/gradients_1/policy_1/truediv_grad/tuple/group_depsNoOp4^optimizer/gradients_1/policy_1/truediv_grad/Reshape6^optimizer/gradients_1/policy_1/truediv_grad/Reshape_1

Doptimizer/gradients_1/policy_1/truediv_grad/tuple/control_dependencyIdentity3optimizer/gradients_1/policy_1/truediv_grad/Reshape=^optimizer/gradients_1/policy_1/truediv_grad/tuple/group_deps*
T0*F
_class<
:8loc:@optimizer/gradients_1/policy_1/truediv_grad/Reshape

Foptimizer/gradients_1/policy_1/truediv_grad/tuple/control_dependency_1Identity5optimizer/gradients_1/policy_1/truediv_grad/Reshape_1=^optimizer/gradients_1/policy_1/truediv_grad/tuple/group_deps*H
_class>
<:loc:@optimizer/gradients_1/policy_1/truediv_grad/Reshape_1*
T0
é
qoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/ShapeShapeToptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd*
T0*
out_type0
ė
soptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Shape_1ShapeToptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Sigmoid*
T0*
out_type0

optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsqoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Shapesoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Shape_1*
T0
ß
ooptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/MulMuloptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/control_dependencyToptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Sigmoid*
T0

ooptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/SumSumooptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Muloptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
ł
soptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/ReshapeReshapeooptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Sumqoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Shape*
T0*
Tshape0
į
qoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Mul_1MulToptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAddoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/control_dependency*
T0

qoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Sum_1Sumqoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Mul_1optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
’
uoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape_1Reshapeqoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Sum_1soptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Shape_1*
T0*
Tshape0
ņ
|optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/tuple/group_depsNoOpt^optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshapev^optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape_1

optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/tuple/control_dependencyIdentitysoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape}^optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/tuple/group_deps*
T0*
_class|
zxloc:@optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape

optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/tuple/control_dependency_1Identityuoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape_1}^optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/tuple/group_deps*
T0*
_class~
|zloc:@optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape_1
]
-optimizer/gradients_1/policy_1/Sum_grad/ShapeShapepolicy_1/Mul*
out_type0*
T0

,optimizer/gradients_1/policy_1/Sum_grad/SizeConst*@
_class6
42loc:@optimizer/gradients_1/policy_1/Sum_grad/Shape*
value	B :*
dtype0
Ė
+optimizer/gradients_1/policy_1/Sum_grad/addAddpolicy_1/Sum/reduction_indices,optimizer/gradients_1/policy_1/Sum_grad/Size*@
_class6
42loc:@optimizer/gradients_1/policy_1/Sum_grad/Shape*
T0
Ż
+optimizer/gradients_1/policy_1/Sum_grad/modFloorMod+optimizer/gradients_1/policy_1/Sum_grad/add,optimizer/gradients_1/policy_1/Sum_grad/Size*
T0*@
_class6
42loc:@optimizer/gradients_1/policy_1/Sum_grad/Shape

/optimizer/gradients_1/policy_1/Sum_grad/Shape_1Const*@
_class6
42loc:@optimizer/gradients_1/policy_1/Sum_grad/Shape*
valueB *
dtype0

3optimizer/gradients_1/policy_1/Sum_grad/range/startConst*@
_class6
42loc:@optimizer/gradients_1/policy_1/Sum_grad/Shape*
value	B : *
dtype0

3optimizer/gradients_1/policy_1/Sum_grad/range/deltaConst*@
_class6
42loc:@optimizer/gradients_1/policy_1/Sum_grad/Shape*
value	B :*
dtype0

-optimizer/gradients_1/policy_1/Sum_grad/rangeRange3optimizer/gradients_1/policy_1/Sum_grad/range/start,optimizer/gradients_1/policy_1/Sum_grad/Size3optimizer/gradients_1/policy_1/Sum_grad/range/delta*@
_class6
42loc:@optimizer/gradients_1/policy_1/Sum_grad/Shape*

Tidx0

2optimizer/gradients_1/policy_1/Sum_grad/Fill/valueConst*@
_class6
42loc:@optimizer/gradients_1/policy_1/Sum_grad/Shape*
value	B :*
dtype0
ö
,optimizer/gradients_1/policy_1/Sum_grad/FillFill/optimizer/gradients_1/policy_1/Sum_grad/Shape_12optimizer/gradients_1/policy_1/Sum_grad/Fill/value*
T0*@
_class6
42loc:@optimizer/gradients_1/policy_1/Sum_grad/Shape*

index_type0
Ó
5optimizer/gradients_1/policy_1/Sum_grad/DynamicStitchDynamicStitch-optimizer/gradients_1/policy_1/Sum_grad/range+optimizer/gradients_1/policy_1/Sum_grad/mod-optimizer/gradients_1/policy_1/Sum_grad/Shape,optimizer/gradients_1/policy_1/Sum_grad/Fill*
T0*@
_class6
42loc:@optimizer/gradients_1/policy_1/Sum_grad/Shape*
N

1optimizer/gradients_1/policy_1/Sum_grad/Maximum/yConst*@
_class6
42loc:@optimizer/gradients_1/policy_1/Sum_grad/Shape*
value	B :*
dtype0
ļ
/optimizer/gradients_1/policy_1/Sum_grad/MaximumMaximum5optimizer/gradients_1/policy_1/Sum_grad/DynamicStitch1optimizer/gradients_1/policy_1/Sum_grad/Maximum/y*
T0*@
_class6
42loc:@optimizer/gradients_1/policy_1/Sum_grad/Shape
ē
0optimizer/gradients_1/policy_1/Sum_grad/floordivFloorDiv-optimizer/gradients_1/policy_1/Sum_grad/Shape/optimizer/gradients_1/policy_1/Sum_grad/Maximum*
T0*@
_class6
42loc:@optimizer/gradients_1/policy_1/Sum_grad/Shape
Š
/optimizer/gradients_1/policy_1/Sum_grad/ReshapeReshapeFoptimizer/gradients_1/policy_1/truediv_grad/tuple/control_dependency_15optimizer/gradients_1/policy_1/Sum_grad/DynamicStitch*
T0*
Tshape0
²
,optimizer/gradients_1/policy_1/Sum_grad/TileTile/optimizer/gradients_1/policy_1/Sum_grad/Reshape0optimizer/gradients_1/policy_1/Sum_grad/floordiv*

Tmultiples0*
T0
ņ
{optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Sigmoid_grad/SigmoidGradSigmoidGradToptimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Sigmoidoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/tuple/control_dependency_1*
T0
ņ
optimizer/gradients_1/AddN_4AddNDoptimizer/gradients_1/policy_1/truediv_grad/tuple/control_dependency,optimizer/gradients_1/policy_1/Sum_grad/Tile*
T0*F
_class<
:8loc:@optimizer/gradients_1/policy_1/truediv_grad/Reshape*
N
]
-optimizer/gradients_1/policy_1/Mul_grad/ShapeShapepolicy_1/add*
T0*
out_type0
i
/optimizer/gradients_1/policy_1/Mul_grad/Shape_1Shapepolicy_1/strided_slice*
T0*
out_type0
æ
=optimizer/gradients_1/policy_1/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs-optimizer/gradients_1/policy_1/Mul_grad/Shape/optimizer/gradients_1/policy_1/Mul_grad/Shape_1*
T0
q
+optimizer/gradients_1/policy_1/Mul_grad/MulMuloptimizer/gradients_1/AddN_4policy_1/strided_slice*
T0
Ä
+optimizer/gradients_1/policy_1/Mul_grad/SumSum+optimizer/gradients_1/policy_1/Mul_grad/Mul=optimizer/gradients_1/policy_1/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
­
/optimizer/gradients_1/policy_1/Mul_grad/ReshapeReshape+optimizer/gradients_1/policy_1/Mul_grad/Sum-optimizer/gradients_1/policy_1/Mul_grad/Shape*
Tshape0*
T0
i
-optimizer/gradients_1/policy_1/Mul_grad/Mul_1Mulpolicy_1/addoptimizer/gradients_1/AddN_4*
T0
Ź
-optimizer/gradients_1/policy_1/Mul_grad/Sum_1Sum-optimizer/gradients_1/policy_1/Mul_grad/Mul_1?optimizer/gradients_1/policy_1/Mul_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
³
1optimizer/gradients_1/policy_1/Mul_grad/Reshape_1Reshape-optimizer/gradients_1/policy_1/Mul_grad/Sum_1/optimizer/gradients_1/policy_1/Mul_grad/Shape_1*
T0*
Tshape0
¦
8optimizer/gradients_1/policy_1/Mul_grad/tuple/group_depsNoOp0^optimizer/gradients_1/policy_1/Mul_grad/Reshape2^optimizer/gradients_1/policy_1/Mul_grad/Reshape_1

@optimizer/gradients_1/policy_1/Mul_grad/tuple/control_dependencyIdentity/optimizer/gradients_1/policy_1/Mul_grad/Reshape9^optimizer/gradients_1/policy_1/Mul_grad/tuple/group_deps*
T0*B
_class8
64loc:@optimizer/gradients_1/policy_1/Mul_grad/Reshape

Boptimizer/gradients_1/policy_1/Mul_grad/tuple/control_dependency_1Identity1optimizer/gradients_1/policy_1/Mul_grad/Reshape_19^optimizer/gradients_1/policy_1/Mul_grad/tuple/group_deps*D
_class:
86loc:@optimizer/gradients_1/policy_1/Mul_grad/Reshape_1*
T0
Ć
optimizer/gradients_1/AddN_5AddNoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/tuple/control_dependency{optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Sigmoid_grad/SigmoidGrad*
T0*
_class|
zxloc:@optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape*
N
Č
{optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/BiasAddGradBiasAddGradoptimizer/gradients_1/AddN_5*
T0*
data_formatNHWC
¦
optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/group_depsNoOp^optimizer/gradients_1/AddN_5|^optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/BiasAddGrad
É
optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/control_dependencyIdentityoptimizer/gradients_1/AddN_5^optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*
_class|
zxloc:@optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape
µ
optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/control_dependency_1Identity{optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/BiasAddGrad^optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*
_class
loc:@optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/BiasAddGrad
a
-optimizer/gradients_1/policy_1/add_grad/ShapeShapepolicy_1/Softmax*
T0*
out_type0
X
/optimizer/gradients_1/policy_1/add_grad/Shape_1Const*
valueB *
dtype0
æ
=optimizer/gradients_1/policy_1/add_grad/BroadcastGradientArgsBroadcastGradientArgs-optimizer/gradients_1/policy_1/add_grad/Shape/optimizer/gradients_1/policy_1/add_grad/Shape_1*
T0
Ł
+optimizer/gradients_1/policy_1/add_grad/SumSum@optimizer/gradients_1/policy_1/Mul_grad/tuple/control_dependency=optimizer/gradients_1/policy_1/add_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
­
/optimizer/gradients_1/policy_1/add_grad/ReshapeReshape+optimizer/gradients_1/policy_1/add_grad/Sum-optimizer/gradients_1/policy_1/add_grad/Shape*
T0*
Tshape0
Ż
-optimizer/gradients_1/policy_1/add_grad/Sum_1Sum@optimizer/gradients_1/policy_1/Mul_grad/tuple/control_dependency?optimizer/gradients_1/policy_1/add_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
³
1optimizer/gradients_1/policy_1/add_grad/Reshape_1Reshape-optimizer/gradients_1/policy_1/add_grad/Sum_1/optimizer/gradients_1/policy_1/add_grad/Shape_1*
T0*
Tshape0
¦
8optimizer/gradients_1/policy_1/add_grad/tuple/group_depsNoOp0^optimizer/gradients_1/policy_1/add_grad/Reshape2^optimizer/gradients_1/policy_1/add_grad/Reshape_1

@optimizer/gradients_1/policy_1/add_grad/tuple/control_dependencyIdentity/optimizer/gradients_1/policy_1/add_grad/Reshape9^optimizer/gradients_1/policy_1/add_grad/tuple/group_deps*B
_class8
64loc:@optimizer/gradients_1/policy_1/add_grad/Reshape*
T0

Boptimizer/gradients_1/policy_1/add_grad/tuple/control_dependency_1Identity1optimizer/gradients_1/policy_1/add_grad/Reshape_19^optimizer/gradients_1/policy_1/add_grad/tuple/group_deps*
T0*D
_class:
86loc:@optimizer/gradients_1/policy_1/add_grad/Reshape_1

uoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMulMatMuloptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/control_dependencyYoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/read*
T0*
transpose_a( *
transpose_b(
ģ
woptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMul_1MatMul/optimizer/main_graph_0_encoder0/flatten/Reshapeoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/control_dependency*
T0*
transpose_a(*
transpose_b( 
ł
optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/tuple/group_depsNoOpv^optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMulx^optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMul_1
¢
optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/tuple/control_dependencyIdentityuoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMul^optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/tuple/group_deps*
T0*
_class~
|zloc:@optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMul
©
optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/tuple/control_dependency_1Identitywoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMul_1^optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/tuple/group_deps*
T0*
_class
~|loc:@optimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMul_1

/optimizer/gradients_1/policy_1/Softmax_grad/mulMul@optimizer/gradients_1/policy_1/add_grad/tuple/control_dependencypolicy_1/Softmax*
T0
t
Aoptimizer/gradients_1/policy_1/Softmax_grad/Sum/reduction_indicesConst*
valueB :
’’’’’’’’’*
dtype0
Š
/optimizer/gradients_1/policy_1/Softmax_grad/SumSum/optimizer/gradients_1/policy_1/Softmax_grad/mulAoptimizer/gradients_1/policy_1/Softmax_grad/Sum/reduction_indices*

Tidx0*
	keep_dims(*
T0
²
/optimizer/gradients_1/policy_1/Softmax_grad/subSub@optimizer/gradients_1/policy_1/add_grad/tuple/control_dependency/optimizer/gradients_1/policy_1/Softmax_grad/Sum*
T0

1optimizer/gradients_1/policy_1/Softmax_grad/mul_1Mul/optimizer/gradients_1/policy_1/Softmax_grad/subpolicy_1/Softmax*
T0

Poptimizer/gradients_1/optimizer/main_graph_0_encoder0/flatten/Reshape_grad/ShapeShape*optimizer/main_graph_0_encoder0/conv_2/Elu*
T0*
out_type0
Š
Roptimizer/gradients_1/optimizer/main_graph_0_encoder0/flatten/Reshape_grad/ReshapeReshapeoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/tuple/control_dependencyPoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flatten/Reshape_grad/Shape*
T0*
Tshape0
½
7optimizer/gradients_1/policy_1/dense/MatMul_grad/MatMulMatMul1optimizer/gradients_1/policy_1/Softmax_grad/mul_1policy/dense/kernel/read*
transpose_a( *
transpose_b(*
T0
“
9optimizer/gradients_1/policy_1/dense/MatMul_grad/MatMul_1MatMulpolicy/concat1optimizer/gradients_1/policy_1/Softmax_grad/mul_1*
transpose_a(*
transpose_b( *
T0
æ
Aoptimizer/gradients_1/policy_1/dense/MatMul_grad/tuple/group_depsNoOp8^optimizer/gradients_1/policy_1/dense/MatMul_grad/MatMul:^optimizer/gradients_1/policy_1/dense/MatMul_grad/MatMul_1
§
Ioptimizer/gradients_1/policy_1/dense/MatMul_grad/tuple/control_dependencyIdentity7optimizer/gradients_1/policy_1/dense/MatMul_grad/MatMulB^optimizer/gradients_1/policy_1/dense/MatMul_grad/tuple/group_deps*
T0*J
_class@
><loc:@optimizer/gradients_1/policy_1/dense/MatMul_grad/MatMul
­
Koptimizer/gradients_1/policy_1/dense/MatMul_grad/tuple/control_dependency_1Identity9optimizer/gradients_1/policy_1/dense/MatMul_grad/MatMul_1B^optimizer/gradients_1/policy_1/dense/MatMul_grad/tuple/group_deps*
T0*L
_classB
@>loc:@optimizer/gradients_1/policy_1/dense/MatMul_grad/MatMul_1
į
Moptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/Elu_grad/EluGradEluGradRoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flatten/Reshape_grad/Reshape*optimizer/main_graph_0_encoder0/conv_2/Elu*
T0
Ó
Uoptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/BiasAdd_grad/BiasAddGradBiasAddGradMoptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/Elu_grad/EluGrad*
T0*
data_formatNHWC

Zoptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/group_depsNoOpV^optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/BiasAdd_grad/BiasAddGradN^optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/Elu_grad/EluGrad

boptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/control_dependencyIdentityMoptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/Elu_grad/EluGrad[^optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/group_deps*
T0*`
_classV
TRloc:@optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/Elu_grad/EluGrad

doptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/control_dependency_1IdentityUoptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/BiasAdd_grad/BiasAddGrad[^optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/group_deps*
T0*h
_class^
\Zloc:@optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/BiasAdd_grad/BiasAddGrad
ć
noptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/ShapeShapeQpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd*
T0*
out_type0
å
poptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Shape_1ShapeQpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Sigmoid*
T0*
out_type0

~optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsnoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Shapepoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Shape_1*
T0

loptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/MulMulIoptimizer/gradients_1/policy_1/dense/MatMul_grad/tuple/control_dependencyQpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Sigmoid*
T0

loptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/SumSumloptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Mul~optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
š
poptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/ReshapeReshapeloptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Sumnoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Shape*
T0*
Tshape0

noptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Mul_1MulQpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAddIoptimizer/gradients_1/policy_1/dense/MatMul_grad/tuple/control_dependency*
T0

noptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Sum_1Sumnoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Mul_1optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
ö
roptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape_1Reshapenoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Sum_1poptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Shape_1*
T0*
Tshape0
é
yoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/tuple/group_depsNoOpq^optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshapes^optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape_1

optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/tuple/control_dependencyIdentitypoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshapez^optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/tuple/group_deps*
T0*
_classy
wuloc:@optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape

optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/tuple/control_dependency_1Identityroptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape_1z^optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/tuple/group_deps*
T0*
_class{
ywloc:@optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape_1
Ü
Ooptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/ShapeNShapeN*optimizer/main_graph_0_encoder0/conv_1/Elu3optimizer//main_graph_0_encoder0/conv_2/kernel/read*
T0*
out_type0*
N
ī
\optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropInputConv2DBackpropInputOoptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/ShapeN3optimizer//main_graph_0_encoder0/conv_2/kernel/readboptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/control_dependency*
T0*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
explicit_paddings
 *
paddingVALID*
	dilations

é
]optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropFilterConv2DBackpropFilter*optimizer/main_graph_0_encoder0/conv_1/EluQoptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/ShapeN:1boptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/control_dependency*
paddingVALID*
	dilations
*
T0*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
explicit_paddings
 
 
Yoptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/tuple/group_depsNoOp^^optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropFilter]^optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropInput
”
aoptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/tuple/control_dependencyIdentity\optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropInputZ^optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/tuple/group_deps*
T0*o
_classe
caloc:@optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropInput
„
coptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/tuple/control_dependency_1Identity]optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropFilterZ^optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/tuple/group_deps*p
_classf
dbloc:@optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropFilter*
T0
é
xoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Sigmoid_grad/SigmoidGradSigmoidGradQpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Sigmoidoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/tuple/control_dependency_1*
T0
š
Moptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/Elu_grad/EluGradEluGradaoptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/tuple/control_dependency*optimizer/main_graph_0_encoder0/conv_1/Elu*
T0
ŗ
optimizer/gradients_1/AddN_6AddNoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/tuple/control_dependencyxoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Sigmoid_grad/SigmoidGrad*
N*
T0*
_classy
wuloc:@optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape
Å
xoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/BiasAddGradBiasAddGradoptimizer/gradients_1/AddN_6*
T0*
data_formatNHWC

}optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/group_depsNoOp^optimizer/gradients_1/AddN_6y^optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/BiasAddGrad
æ
optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/control_dependencyIdentityoptimizer/gradients_1/AddN_6~^optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/group_deps*
_classy
wuloc:@optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/Mul_grad/Reshape*
T0
¦
optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/control_dependency_1Identityxoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/BiasAddGrad~^optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*
_class
}loc:@optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/BiasAddGrad
Ó
Uoptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/BiasAdd_grad/BiasAddGradBiasAddGradMoptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/Elu_grad/EluGrad*
data_formatNHWC*
T0

Zoptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/group_depsNoOpV^optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/BiasAdd_grad/BiasAddGradN^optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/Elu_grad/EluGrad

boptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/control_dependencyIdentityMoptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/Elu_grad/EluGrad[^optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/group_deps*`
_classV
TRloc:@optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/Elu_grad/EluGrad*
T0

doptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/control_dependency_1IdentityUoptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/BiasAdd_grad/BiasAddGrad[^optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/group_deps*
T0*h
_class^
\Zloc:@optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/BiasAdd_grad/BiasAddGrad

roptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMulMatMuloptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/control_dependencyUpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/read*
T0*
transpose_a( *
transpose_b(

toptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMul_1MatMulMpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Muloptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/control_dependency*
T0*
transpose_a(*
transpose_b( 
š
|optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/group_depsNoOps^optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMulu^optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMul_1

optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/control_dependencyIdentityroptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMul}^optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/group_deps*
T0*
_class{
ywloc:@optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMul

optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/control_dependency_1Identitytoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMul_1}^optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/group_deps*
T0*
_class}
{yloc:@optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/MatMul_1
Ę
Ooptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/ShapeNShapeNvisual_observation_03optimizer//main_graph_0_encoder0/conv_1/kernel/read*
T0*
out_type0*
N
ī
\optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropInputConv2DBackpropInputOoptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/ShapeN3optimizer//main_graph_0_encoder0/conv_1/kernel/readboptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/control_dependency*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingVALID*
	dilations
*
T0*
data_formatNHWC*
strides

Ó
]optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropFilterConv2DBackpropFiltervisual_observation_0Qoptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/ShapeN:1boptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/control_dependency*
paddingVALID*
	dilations
*
T0*
data_formatNHWC*
strides
*
explicit_paddings
 *
use_cudnn_on_gpu(
 
Yoptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/tuple/group_depsNoOp^^optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropFilter]^optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropInput
”
aoptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/tuple/control_dependencyIdentity\optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropInputZ^optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/tuple/group_deps*o
_classe
caloc:@optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropInput*
T0
„
coptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/tuple/control_dependency_1Identity]optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropFilterZ^optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/tuple/group_deps*p
_classf
dbloc:@optimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropFilter*
T0
ć
noptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/ShapeShapeQpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd*
T0*
out_type0
å
poptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Shape_1ShapeQpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Sigmoid*
T0*
out_type0

~optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsnoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Shapepoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Shape_1*
T0
Ö
loptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/MulMuloptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/control_dependencyQpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Sigmoid*
T0

loptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/SumSumloptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Mul~optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
š
poptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/ReshapeReshapeloptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Sumnoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Shape*
Tshape0*
T0
Ų
noptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Mul_1MulQpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAddoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/control_dependency*
T0

noptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Sum_1Sumnoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Mul_1optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
ö
roptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape_1Reshapenoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Sum_1poptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Shape_1*
T0*
Tshape0
é
yoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/tuple/group_depsNoOpq^optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshapes^optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape_1

optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/tuple/control_dependencyIdentitypoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshapez^optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/tuple/group_deps*
T0*
_classy
wuloc:@optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape

optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/tuple/control_dependency_1Identityroptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape_1z^optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/tuple/group_deps*
_class{
ywloc:@optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape_1*
T0
é
xoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Sigmoid_grad/SigmoidGradSigmoidGradQpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Sigmoidoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/tuple/control_dependency_1*
T0
ŗ
optimizer/gradients_1/AddN_7AddNoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/tuple/control_dependencyxoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Sigmoid_grad/SigmoidGrad*
T0*
_classy
wuloc:@optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape*
N
Å
xoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/BiasAddGradBiasAddGradoptimizer/gradients_1/AddN_7*
T0*
data_formatNHWC

}optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/group_depsNoOp^optimizer/gradients_1/AddN_7y^optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/BiasAddGrad
æ
optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/control_dependencyIdentityoptimizer/gradients_1/AddN_7~^optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*
_classy
wuloc:@optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/Mul_grad/Reshape
¦
optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/control_dependency_1Identityxoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/BiasAddGrad~^optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*
_class
}loc:@optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/BiasAddGrad

roptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMulMatMuloptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/control_dependencyUpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/read*
transpose_a( *
transpose_b(*
T0
ć
toptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMul_1MatMul,policy/main_graph_0_encoder0/flatten/Reshapeoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/control_dependency*
transpose_a(*
transpose_b( *
T0
š
|optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/tuple/group_depsNoOps^optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMulu^optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMul_1

optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/tuple/control_dependencyIdentityroptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMul}^optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/tuple/group_deps*
T0*
_class{
ywloc:@optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMul

optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/tuple/control_dependency_1Identitytoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMul_1}^optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/tuple/group_deps*
T0*
_class}
{yloc:@optimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/MatMul_1

Moptimizer/gradients_1/policy/main_graph_0_encoder0/flatten/Reshape_grad/ShapeShape'policy/main_graph_0_encoder0/conv_2/Elu*
T0*
out_type0
Ē
Ooptimizer/gradients_1/policy/main_graph_0_encoder0/flatten/Reshape_grad/ReshapeReshapeoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/tuple/control_dependencyMoptimizer/gradients_1/policy/main_graph_0_encoder0/flatten/Reshape_grad/Shape*
T0*
Tshape0
Ų
Joptimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/Elu_grad/EluGradEluGradOoptimizer/gradients_1/policy/main_graph_0_encoder0/flatten/Reshape_grad/Reshape'policy/main_graph_0_encoder0/conv_2/Elu*
T0
Ķ
Roptimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/BiasAdd_grad/BiasAddGradBiasAddGradJoptimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/Elu_grad/EluGrad*
T0*
data_formatNHWC

Woptimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/group_depsNoOpS^optimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/BiasAdd_grad/BiasAddGradK^optimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/Elu_grad/EluGrad
ł
_optimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/control_dependencyIdentityJoptimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/Elu_grad/EluGradX^optimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/group_deps*
T0*]
_classS
QOloc:@optimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/Elu_grad/EluGrad

aoptimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/control_dependency_1IdentityRoptimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/BiasAdd_grad/BiasAddGradX^optimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/group_deps*
T0*e
_class[
YWloc:@optimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/BiasAdd_grad/BiasAddGrad
Ņ
Loptimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/ShapeNShapeN'policy/main_graph_0_encoder0/conv_1/Elu/policy/main_graph_0_encoder0/conv_2/kernel/read*
T0*
out_type0*
N
į
Yoptimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropInputConv2DBackpropInputLoptimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/ShapeN/policy/main_graph_0_encoder0/conv_2/kernel/read_optimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/control_dependency*
	dilations
*
T0*
data_formatNHWC*
strides
*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingVALID
Ż
Zoptimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropFilterConv2DBackpropFilter'policy/main_graph_0_encoder0/conv_1/EluNoptimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/ShapeN:1_optimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/control_dependency*
	dilations
*
T0*
data_formatNHWC*
strides
*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingVALID

Voptimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/tuple/group_depsNoOp[^optimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropFilterZ^optimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropInput

^optimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/tuple/control_dependencyIdentityYoptimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropInputW^optimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/tuple/group_deps*
T0*l
_classb
`^loc:@optimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropInput

`optimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/tuple/control_dependency_1IdentityZoptimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropFilterW^optimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/tuple/group_deps*
T0*m
_classc
a_loc:@optimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/Conv2DBackpropFilter
ē
Joptimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/Elu_grad/EluGradEluGrad^optimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/tuple/control_dependency'policy/main_graph_0_encoder0/conv_1/Elu*
T0
Ķ
Roptimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/BiasAdd_grad/BiasAddGradBiasAddGradJoptimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/Elu_grad/EluGrad*
T0*
data_formatNHWC

Woptimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/group_depsNoOpS^optimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/BiasAdd_grad/BiasAddGradK^optimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/Elu_grad/EluGrad
ł
_optimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/control_dependencyIdentityJoptimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/Elu_grad/EluGradX^optimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/group_deps*]
_classS
QOloc:@optimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/Elu_grad/EluGrad*
T0

aoptimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/control_dependency_1IdentityRoptimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/BiasAdd_grad/BiasAddGradX^optimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/group_deps*
T0*e
_class[
YWloc:@optimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/BiasAdd_grad/BiasAddGrad
æ
Loptimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/ShapeNShapeNvisual_observation_0/policy/main_graph_0_encoder0/conv_1/kernel/read*
T0*
out_type0*
N
į
Yoptimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropInputConv2DBackpropInputLoptimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/ShapeN/policy/main_graph_0_encoder0/conv_1/kernel/read_optimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/control_dependency*
paddingVALID*
	dilations
*
T0*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
explicit_paddings
 
Ź
Zoptimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropFilterConv2DBackpropFiltervisual_observation_0Noptimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/ShapeN:1_optimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/control_dependency*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
explicit_paddings
 *
paddingVALID*
	dilations
*
T0

Voptimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/tuple/group_depsNoOp[^optimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropFilterZ^optimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropInput

^optimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/tuple/control_dependencyIdentityYoptimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropInputW^optimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/tuple/group_deps*
T0*l
_classb
`^loc:@optimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropInput

`optimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/tuple/control_dependency_1IdentityZoptimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropFilterW^optimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/tuple/group_deps*
T0*m
_classc
a_loc:@optimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/Conv2DBackpropFilter

#optimizer/beta1_power/initial_valueConst*2
_class(
&$loc:@optimizer//extrinsic_value/bias*
valueB
 *fff?*
dtype0

optimizer/beta1_power
VariableV2*
shape: *
shared_name *2
_class(
&$loc:@optimizer//extrinsic_value/bias*
dtype0*
	container 
Č
optimizer/beta1_power/AssignAssignoptimizer/beta1_power#optimizer/beta1_power/initial_value*
use_locking(*
T0*2
_class(
&$loc:@optimizer//extrinsic_value/bias*
validate_shape(
z
optimizer/beta1_power/readIdentityoptimizer/beta1_power*
T0*2
_class(
&$loc:@optimizer//extrinsic_value/bias

#optimizer/beta2_power/initial_valueConst*2
_class(
&$loc:@optimizer//extrinsic_value/bias*
valueB
 *w¾?*
dtype0

optimizer/beta2_power
VariableV2*
shape: *
shared_name *2
_class(
&$loc:@optimizer//extrinsic_value/bias*
dtype0*
	container 
Č
optimizer/beta2_power/AssignAssignoptimizer/beta2_power#optimizer/beta2_power/initial_value*2
_class(
&$loc:@optimizer//extrinsic_value/bias*
validate_shape(*
use_locking(*
T0
z
optimizer/beta2_power/readIdentityoptimizer/beta2_power*
T0*2
_class(
&$loc:@optimizer//extrinsic_value/bias
Ų
\optimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam/Initializer/zeros/shape_as_tensorConst*%
valueB"            *=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_1/kernel*
dtype0
¾
Roptimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_1/kernel*
dtype0
ą
Loptimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam/Initializer/zerosFill\optimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam/Initializer/zeros/shape_as_tensorRoptimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam/Initializer/zeros/Const*

index_type0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_1/kernel*
T0
Õ
:optimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam
VariableV2*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_1/kernel*
dtype0*
	container *
shape:*
shared_name 
Ę
Aoptimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam/AssignAssign:optimizer//policy/main_graph_0_encoder0/conv_1/kernel/AdamLoptimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam/Initializer/zeros*
use_locking(*
T0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_1/kernel*
validate_shape(
Ļ
?optimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam/readIdentity:optimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam*
T0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_1/kernel
Ś
^optimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*%
valueB"            *=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_1/kernel*
dtype0
Ą
Toptimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam_1/Initializer/zeros/ConstConst*
dtype0*
valueB
 *    *=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_1/kernel
ę
Noptimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam_1/Initializer/zerosFill^optimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam_1/Initializer/zeros/shape_as_tensorToptimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_1/kernel
×
<optimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam_1
VariableV2*
dtype0*
	container *
shape:*
shared_name *=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_1/kernel
Ģ
Coptimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam_1/AssignAssign<optimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam_1Noptimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_1/kernel*
validate_shape(
Ó
Aoptimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam_1/readIdentity<optimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam_1*
T0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_1/kernel
ø
Joptimizer//policy/main_graph_0_encoder0/conv_1/bias/Adam/Initializer/zerosConst*
valueB*    *;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_1/bias*
dtype0
Å
8optimizer//policy/main_graph_0_encoder0/conv_1/bias/Adam
VariableV2*
shared_name *;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_1/bias*
dtype0*
	container *
shape:
¾
?optimizer//policy/main_graph_0_encoder0/conv_1/bias/Adam/AssignAssign8optimizer//policy/main_graph_0_encoder0/conv_1/bias/AdamJoptimizer//policy/main_graph_0_encoder0/conv_1/bias/Adam/Initializer/zeros*
use_locking(*
T0*;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_1/bias*
validate_shape(
É
=optimizer//policy/main_graph_0_encoder0/conv_1/bias/Adam/readIdentity8optimizer//policy/main_graph_0_encoder0/conv_1/bias/Adam*
T0*;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_1/bias
ŗ
Loptimizer//policy/main_graph_0_encoder0/conv_1/bias/Adam_1/Initializer/zerosConst*
valueB*    *;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_1/bias*
dtype0
Ē
:optimizer//policy/main_graph_0_encoder0/conv_1/bias/Adam_1
VariableV2*
shared_name *;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_1/bias*
dtype0*
	container *
shape:
Ä
Aoptimizer//policy/main_graph_0_encoder0/conv_1/bias/Adam_1/AssignAssign:optimizer//policy/main_graph_0_encoder0/conv_1/bias/Adam_1Loptimizer//policy/main_graph_0_encoder0/conv_1/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_1/bias*
validate_shape(
Ķ
?optimizer//policy/main_graph_0_encoder0/conv_1/bias/Adam_1/readIdentity:optimizer//policy/main_graph_0_encoder0/conv_1/bias/Adam_1*;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_1/bias*
T0
Ų
\optimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam/Initializer/zeros/shape_as_tensorConst*%
valueB"             *=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_2/kernel*
dtype0
¾
Roptimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_2/kernel*
dtype0
ą
Loptimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam/Initializer/zerosFill\optimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam/Initializer/zeros/shape_as_tensorRoptimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_2/kernel
Õ
:optimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam
VariableV2*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_2/kernel*
dtype0*
	container *
shape: *
shared_name 
Ę
Aoptimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam/AssignAssign:optimizer//policy/main_graph_0_encoder0/conv_2/kernel/AdamLoptimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam/Initializer/zeros*
use_locking(*
T0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_2/kernel*
validate_shape(
Ļ
?optimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam/readIdentity:optimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam*
T0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_2/kernel
Ś
^optimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*%
valueB"             *=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_2/kernel*
dtype0
Ą
Toptimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_2/kernel*
dtype0
ę
Noptimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam_1/Initializer/zerosFill^optimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam_1/Initializer/zeros/shape_as_tensorToptimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_2/kernel
×
<optimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam_1
VariableV2*
shape: *
shared_name *=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_2/kernel*
dtype0*
	container 
Ģ
Coptimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam_1/AssignAssign<optimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam_1Noptimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_2/kernel*
validate_shape(
Ó
Aoptimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam_1/readIdentity<optimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam_1*
T0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_2/kernel
ø
Joptimizer//policy/main_graph_0_encoder0/conv_2/bias/Adam/Initializer/zerosConst*
valueB *    *;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_2/bias*
dtype0
Å
8optimizer//policy/main_graph_0_encoder0/conv_2/bias/Adam
VariableV2*
shape: *
shared_name *;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_2/bias*
dtype0*
	container 
¾
?optimizer//policy/main_graph_0_encoder0/conv_2/bias/Adam/AssignAssign8optimizer//policy/main_graph_0_encoder0/conv_2/bias/AdamJoptimizer//policy/main_graph_0_encoder0/conv_2/bias/Adam/Initializer/zeros*
use_locking(*
T0*;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_2/bias*
validate_shape(
É
=optimizer//policy/main_graph_0_encoder0/conv_2/bias/Adam/readIdentity8optimizer//policy/main_graph_0_encoder0/conv_2/bias/Adam*
T0*;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_2/bias
ŗ
Loptimizer//policy/main_graph_0_encoder0/conv_2/bias/Adam_1/Initializer/zerosConst*
valueB *    *;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_2/bias*
dtype0
Ē
:optimizer//policy/main_graph_0_encoder0/conv_2/bias/Adam_1
VariableV2*
shared_name *;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_2/bias*
dtype0*
	container *
shape: 
Ä
Aoptimizer//policy/main_graph_0_encoder0/conv_2/bias/Adam_1/AssignAssign:optimizer//policy/main_graph_0_encoder0/conv_2/bias/Adam_1Loptimizer//policy/main_graph_0_encoder0/conv_2/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_2/bias*
validate_shape(
Ķ
?optimizer//policy/main_graph_0_encoder0/conv_2/bias/Adam_1/readIdentity:optimizer//policy/main_graph_0_encoder0/conv_2/bias/Adam_1*
T0*;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_2/bias

optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
dtype0*
valueB" 
     *c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel

xoptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
dtype0
ł
roptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam/Initializer/zerosFilloptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam/Initializer/zeros/shape_as_tensorxoptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel

`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam
VariableV2*
shared_name *c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
dtype0*
	container *
shape:
 
Ž
goptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam/AssignAssign`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adamroptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam/Initializer/zeros*
use_locking(*
T0*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
validate_shape(
Į
eoptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam/readIdentity`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam*
T0*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel

optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB" 
     *c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
dtype0

zoptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
dtype0
’
toptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1/Initializer/zerosFilloptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1/Initializer/zeros/shape_as_tensorzoptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel

boptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1
VariableV2*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
dtype0*
	container *
shape:
 *
shared_name 
ä
ioptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1/AssignAssignboptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1toptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1/Initializer/zeros*
T0*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
validate_shape(*
use_locking(
Å
goptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1/readIdentityboptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1*
T0*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel

poptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam/Initializer/zerosConst*
valueB*    *a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias*
dtype0

^optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam
VariableV2*
shared_name *a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias*
dtype0*
	container *
shape:
Ö
eoptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam/AssignAssign^optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adampoptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam/Initializer/zeros*
use_locking(*
T0*a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias*
validate_shape(
»
coptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam/readIdentity^optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam*
T0*a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias

roptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam_1/Initializer/zerosConst*
valueB*    *a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias*
dtype0

`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam_1
VariableV2*
shared_name *a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias*
dtype0*
	container *
shape:
Ü
goptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam_1/AssignAssign`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam_1roptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias*
validate_shape(
æ
eoptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam_1/readIdentity`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam_1*
T0*a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias

optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"      *c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
dtype0

xoptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
dtype0
ł
roptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam/Initializer/zerosFilloptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam/Initializer/zeros/shape_as_tensorxoptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel

`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam
VariableV2*
shape:
*
shared_name *c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
dtype0*
	container 
Ž
goptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam/AssignAssign`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adamroptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam/Initializer/zeros*
use_locking(*
T0*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
validate_shape(
Į
eoptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam/readIdentity`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam*
T0*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel

optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
dtype0*
valueB"      *c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel

zoptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
dtype0
’
toptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1/Initializer/zerosFilloptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1/Initializer/zeros/shape_as_tensorzoptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel

boptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1
VariableV2*
dtype0*
	container *
shape:
*
shared_name *c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel
ä
ioptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1/AssignAssignboptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1toptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
validate_shape(
Å
goptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1/readIdentityboptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1*
T0*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel

poptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam/Initializer/zerosConst*
dtype0*
valueB*    *a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias

^optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam
VariableV2*a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias*
dtype0*
	container *
shape:*
shared_name 
Ö
eoptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam/AssignAssign^optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adampoptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam/Initializer/zeros*
use_locking(*
T0*a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias*
validate_shape(
»
coptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam/readIdentity^optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam*
T0*a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias

roptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam_1/Initializer/zerosConst*
valueB*    *a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias*
dtype0

`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam_1
VariableV2*
shared_name *a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias*
dtype0*
	container *
shape:
Ü
goptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam_1/AssignAssign`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam_1roptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias*
validate_shape(
æ
eoptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam_1/readIdentity`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam_1*a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias*
T0
¢
Eoptimizer//policy/dense/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
dtype0*
valueB"      *&
_class
loc:@policy/dense/kernel

;optimizer//policy/dense/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *&
_class
loc:@policy/dense/kernel*
dtype0

5optimizer//policy/dense/kernel/Adam/Initializer/zerosFillEoptimizer//policy/dense/kernel/Adam/Initializer/zeros/shape_as_tensor;optimizer//policy/dense/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*&
_class
loc:@policy/dense/kernel
 
#optimizer//policy/dense/kernel/Adam
VariableV2*
shape:	*
shared_name *&
_class
loc:@policy/dense/kernel*
dtype0*
	container 
ź
*optimizer//policy/dense/kernel/Adam/AssignAssign#optimizer//policy/dense/kernel/Adam5optimizer//policy/dense/kernel/Adam/Initializer/zeros*
use_locking(*
T0*&
_class
loc:@policy/dense/kernel*
validate_shape(

(optimizer//policy/dense/kernel/Adam/readIdentity#optimizer//policy/dense/kernel/Adam*&
_class
loc:@policy/dense/kernel*
T0
¤
Goptimizer//policy/dense/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"      *&
_class
loc:@policy/dense/kernel*
dtype0

=optimizer//policy/dense/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *&
_class
loc:@policy/dense/kernel*
dtype0

7optimizer//policy/dense/kernel/Adam_1/Initializer/zerosFillGoptimizer//policy/dense/kernel/Adam_1/Initializer/zeros/shape_as_tensor=optimizer//policy/dense/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*&
_class
loc:@policy/dense/kernel
¢
%optimizer//policy/dense/kernel/Adam_1
VariableV2*
dtype0*
	container *
shape:	*
shared_name *&
_class
loc:@policy/dense/kernel
š
,optimizer//policy/dense/kernel/Adam_1/AssignAssign%optimizer//policy/dense/kernel/Adam_17optimizer//policy/dense/kernel/Adam_1/Initializer/zeros*
T0*&
_class
loc:@policy/dense/kernel*
validate_shape(*
use_locking(

*optimizer//policy/dense/kernel/Adam_1/readIdentity%optimizer//policy/dense/kernel/Adam_1*
T0*&
_class
loc:@policy/dense/kernel
ą
`optimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
dtype0*%
valueB"            *A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_1/kernel
Ę
Voptimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_1/kernel*
dtype0
š
Poptimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam/Initializer/zerosFill`optimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam/Initializer/zeros/shape_as_tensorVoptimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_1/kernel
Ż
>optimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam
VariableV2*
	container *
shape:*
shared_name *A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_1/kernel*
dtype0
Ö
Eoptimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam/AssignAssign>optimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/AdamPoptimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam/Initializer/zeros*
use_locking(*
T0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_1/kernel*
validate_shape(
Ū
Coptimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam/readIdentity>optimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam*
T0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_1/kernel
ā
boptimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*%
valueB"            *A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_1/kernel*
dtype0
Č
Xoptimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_1/kernel*
dtype0
ö
Roptimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam_1/Initializer/zerosFillboptimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam_1/Initializer/zeros/shape_as_tensorXoptimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_1/kernel
ß
@optimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam_1
VariableV2*
	container *
shape:*
shared_name *A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_1/kernel*
dtype0
Ü
Goptimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam_1/AssignAssign@optimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam_1Roptimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_1/kernel*
validate_shape(
ß
Eoptimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam_1/readIdentity@optimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam_1*
T0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_1/kernel
Ą
Noptimizer//optimizer//main_graph_0_encoder0/conv_1/bias/Adam/Initializer/zerosConst*
valueB*    *?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_1/bias*
dtype0
Ķ
<optimizer//optimizer//main_graph_0_encoder0/conv_1/bias/Adam
VariableV2*
shape:*
shared_name *?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_1/bias*
dtype0*
	container 
Ī
Coptimizer//optimizer//main_graph_0_encoder0/conv_1/bias/Adam/AssignAssign<optimizer//optimizer//main_graph_0_encoder0/conv_1/bias/AdamNoptimizer//optimizer//main_graph_0_encoder0/conv_1/bias/Adam/Initializer/zeros*?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_1/bias*
validate_shape(*
use_locking(*
T0
Õ
Aoptimizer//optimizer//main_graph_0_encoder0/conv_1/bias/Adam/readIdentity<optimizer//optimizer//main_graph_0_encoder0/conv_1/bias/Adam*?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_1/bias*
T0
Ā
Poptimizer//optimizer//main_graph_0_encoder0/conv_1/bias/Adam_1/Initializer/zerosConst*
valueB*    *?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_1/bias*
dtype0
Ļ
>optimizer//optimizer//main_graph_0_encoder0/conv_1/bias/Adam_1
VariableV2*
shared_name *?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_1/bias*
dtype0*
	container *
shape:
Ō
Eoptimizer//optimizer//main_graph_0_encoder0/conv_1/bias/Adam_1/AssignAssign>optimizer//optimizer//main_graph_0_encoder0/conv_1/bias/Adam_1Poptimizer//optimizer//main_graph_0_encoder0/conv_1/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_1/bias*
validate_shape(
Ł
Coptimizer//optimizer//main_graph_0_encoder0/conv_1/bias/Adam_1/readIdentity>optimizer//optimizer//main_graph_0_encoder0/conv_1/bias/Adam_1*
T0*?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_1/bias
ą
`optimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam/Initializer/zeros/shape_as_tensorConst*%
valueB"             *A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_2/kernel*
dtype0
Ę
Voptimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_2/kernel*
dtype0
š
Poptimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam/Initializer/zerosFill`optimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam/Initializer/zeros/shape_as_tensorVoptimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam/Initializer/zeros/Const*

index_type0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_2/kernel*
T0
Ż
>optimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam
VariableV2*
dtype0*
	container *
shape: *
shared_name *A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_2/kernel
Ö
Eoptimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam/AssignAssign>optimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/AdamPoptimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam/Initializer/zeros*
use_locking(*
T0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_2/kernel*
validate_shape(
Ū
Coptimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam/readIdentity>optimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam*
T0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_2/kernel
ā
boptimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
dtype0*%
valueB"             *A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_2/kernel
Č
Xoptimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_2/kernel*
dtype0
ö
Roptimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam_1/Initializer/zerosFillboptimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam_1/Initializer/zeros/shape_as_tensorXoptimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_2/kernel
ß
@optimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam_1
VariableV2*
shared_name *A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_2/kernel*
dtype0*
	container *
shape: 
Ü
Goptimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam_1/AssignAssign@optimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam_1Roptimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_2/kernel*
validate_shape(
ß
Eoptimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam_1/readIdentity@optimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam_1*
T0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_2/kernel
Ą
Noptimizer//optimizer//main_graph_0_encoder0/conv_2/bias/Adam/Initializer/zerosConst*
valueB *    *?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_2/bias*
dtype0
Ķ
<optimizer//optimizer//main_graph_0_encoder0/conv_2/bias/Adam
VariableV2*
	container *
shape: *
shared_name *?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_2/bias*
dtype0
Ī
Coptimizer//optimizer//main_graph_0_encoder0/conv_2/bias/Adam/AssignAssign<optimizer//optimizer//main_graph_0_encoder0/conv_2/bias/AdamNoptimizer//optimizer//main_graph_0_encoder0/conv_2/bias/Adam/Initializer/zeros*
use_locking(*
T0*?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_2/bias*
validate_shape(
Õ
Aoptimizer//optimizer//main_graph_0_encoder0/conv_2/bias/Adam/readIdentity<optimizer//optimizer//main_graph_0_encoder0/conv_2/bias/Adam*
T0*?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_2/bias
Ā
Poptimizer//optimizer//main_graph_0_encoder0/conv_2/bias/Adam_1/Initializer/zerosConst*
valueB *    *?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_2/bias*
dtype0
Ļ
>optimizer//optimizer//main_graph_0_encoder0/conv_2/bias/Adam_1
VariableV2*
	container *
shape: *
shared_name *?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_2/bias*
dtype0
Ō
Eoptimizer//optimizer//main_graph_0_encoder0/conv_2/bias/Adam_1/AssignAssign>optimizer//optimizer//main_graph_0_encoder0/conv_2/bias/Adam_1Poptimizer//optimizer//main_graph_0_encoder0/conv_2/bias/Adam_1/Initializer/zeros*
T0*?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_2/bias*
validate_shape(*
use_locking(
Ł
Coptimizer//optimizer//main_graph_0_encoder0/conv_2/bias/Adam_1/readIdentity>optimizer//optimizer//main_graph_0_encoder0/conv_2/bias/Adam_1*
T0*?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_2/bias
„
optimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB" 
     *g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
dtype0

|optimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
dtype0

voptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam/Initializer/zerosFilloptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam/Initializer/zeros/shape_as_tensor|optimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel
£
doptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam
VariableV2*
shared_name *g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
dtype0*
	container *
shape:
 
ī
koptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam/AssignAssigndoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adamvoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam/Initializer/zeros*
use_locking(*
T0*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
validate_shape(
Ķ
ioptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam/readIdentitydoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam*
T0*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel
§
optimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB" 
     *g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
dtype0

~optimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
dtype0

xoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1/Initializer/zerosFilloptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1/Initializer/zeros/shape_as_tensor~optimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1/Initializer/zeros/Const*

index_type0*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
T0
„
foptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1
VariableV2*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
dtype0*
	container *
shape:
 *
shared_name 
ō
moptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1/AssignAssignfoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1xoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
validate_shape(
Ń
koptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1/readIdentityfoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1*
T0*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel

toptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam/Initializer/zerosConst*
valueB*    *e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias*
dtype0

boptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam
VariableV2*
shape:*
shared_name *e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias*
dtype0*
	container 
ę
ioptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam/AssignAssignboptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adamtoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam/Initializer/zeros*
use_locking(*
T0*e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias*
validate_shape(
Ē
goptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam/readIdentityboptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam*
T0*e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias

voptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam_1/Initializer/zerosConst*
valueB*    *e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias*
dtype0

doptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam_1
VariableV2*
	container *
shape:*
shared_name *e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias*
dtype0
ģ
koptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam_1/AssignAssigndoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam_1voptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias*
validate_shape(
Ė
ioptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam_1/readIdentitydoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam_1*
T0*e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias
„
optimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"      *g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
dtype0

|optimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
dtype0

voptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam/Initializer/zerosFilloptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam/Initializer/zeros/shape_as_tensor|optimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel
£
doptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam
VariableV2*
shape:
*
shared_name *g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
dtype0*
	container 
ī
koptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam/AssignAssigndoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adamvoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam/Initializer/zeros*
use_locking(*
T0*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
validate_shape(
Ķ
ioptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam/readIdentitydoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam*
T0*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel
§
optimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"      *g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
dtype0

~optimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
dtype0

xoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1/Initializer/zerosFilloptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1/Initializer/zeros/shape_as_tensor~optimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel
„
foptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1
VariableV2*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
dtype0*
	container *
shape:
*
shared_name 
ō
moptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1/AssignAssignfoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1xoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
validate_shape(
Ń
koptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1/readIdentityfoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1*
T0*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel

toptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam/Initializer/zerosConst*
valueB*    *e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias*
dtype0

boptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam
VariableV2*
	container *
shape:*
shared_name *e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias*
dtype0
ę
ioptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam/AssignAssignboptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adamtoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam/Initializer/zeros*
use_locking(*
T0*e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias*
validate_shape(
Ē
goptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam/readIdentityboptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam*
T0*e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias

voptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam_1/Initializer/zerosConst*
dtype0*
valueB*    *e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias

doptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam_1
VariableV2*e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias*
dtype0*
	container *
shape:*
shared_name 
ģ
koptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam_1/AssignAssigndoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam_1voptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam_1/Initializer/zeros*
T0*e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias*
validate_shape(*
use_locking(
Ė
ioptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam_1/readIdentitydoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam_1*
T0*e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias
Æ
Coptimizer//optimizer//extrinsic_value/kernel/Adam/Initializer/zerosConst*
valueB	*    *4
_class*
(&loc:@optimizer//extrinsic_value/kernel*
dtype0
¼
1optimizer//optimizer//extrinsic_value/kernel/Adam
VariableV2*4
_class*
(&loc:@optimizer//extrinsic_value/kernel*
dtype0*
	container *
shape:	*
shared_name 
¢
8optimizer//optimizer//extrinsic_value/kernel/Adam/AssignAssign1optimizer//optimizer//extrinsic_value/kernel/AdamCoptimizer//optimizer//extrinsic_value/kernel/Adam/Initializer/zeros*
use_locking(*
T0*4
_class*
(&loc:@optimizer//extrinsic_value/kernel*
validate_shape(
“
6optimizer//optimizer//extrinsic_value/kernel/Adam/readIdentity1optimizer//optimizer//extrinsic_value/kernel/Adam*
T0*4
_class*
(&loc:@optimizer//extrinsic_value/kernel
±
Eoptimizer//optimizer//extrinsic_value/kernel/Adam_1/Initializer/zerosConst*
dtype0*
valueB	*    *4
_class*
(&loc:@optimizer//extrinsic_value/kernel
¾
3optimizer//optimizer//extrinsic_value/kernel/Adam_1
VariableV2*
shape:	*
shared_name *4
_class*
(&loc:@optimizer//extrinsic_value/kernel*
dtype0*
	container 
Ø
:optimizer//optimizer//extrinsic_value/kernel/Adam_1/AssignAssign3optimizer//optimizer//extrinsic_value/kernel/Adam_1Eoptimizer//optimizer//extrinsic_value/kernel/Adam_1/Initializer/zeros*4
_class*
(&loc:@optimizer//extrinsic_value/kernel*
validate_shape(*
use_locking(*
T0
ø
8optimizer//optimizer//extrinsic_value/kernel/Adam_1/readIdentity3optimizer//optimizer//extrinsic_value/kernel/Adam_1*
T0*4
_class*
(&loc:@optimizer//extrinsic_value/kernel
¦
Aoptimizer//optimizer//extrinsic_value/bias/Adam/Initializer/zerosConst*
dtype0*
valueB*    *2
_class(
&$loc:@optimizer//extrinsic_value/bias
³
/optimizer//optimizer//extrinsic_value/bias/Adam
VariableV2*
shape:*
shared_name *2
_class(
&$loc:@optimizer//extrinsic_value/bias*
dtype0*
	container 

6optimizer//optimizer//extrinsic_value/bias/Adam/AssignAssign/optimizer//optimizer//extrinsic_value/bias/AdamAoptimizer//optimizer//extrinsic_value/bias/Adam/Initializer/zeros*
validate_shape(*
use_locking(*
T0*2
_class(
&$loc:@optimizer//extrinsic_value/bias
®
4optimizer//optimizer//extrinsic_value/bias/Adam/readIdentity/optimizer//optimizer//extrinsic_value/bias/Adam*
T0*2
_class(
&$loc:@optimizer//extrinsic_value/bias
Ø
Coptimizer//optimizer//extrinsic_value/bias/Adam_1/Initializer/zerosConst*
valueB*    *2
_class(
&$loc:@optimizer//extrinsic_value/bias*
dtype0
µ
1optimizer//optimizer//extrinsic_value/bias/Adam_1
VariableV2*
dtype0*
	container *
shape:*
shared_name *2
_class(
&$loc:@optimizer//extrinsic_value/bias
 
8optimizer//optimizer//extrinsic_value/bias/Adam_1/AssignAssign1optimizer//optimizer//extrinsic_value/bias/Adam_1Coptimizer//optimizer//extrinsic_value/bias/Adam_1/Initializer/zeros*
validate_shape(*
use_locking(*
T0*2
_class(
&$loc:@optimizer//extrinsic_value/bias
²
6optimizer//optimizer//extrinsic_value/bias/Adam_1/readIdentity1optimizer//optimizer//extrinsic_value/bias/Adam_1*
T0*2
_class(
&$loc:@optimizer//extrinsic_value/bias
A
optimizer/Adam/beta1Const*
valueB
 *fff?*
dtype0
A
optimizer/Adam/beta2Const*
valueB
 *w¾?*
dtype0
C
optimizer/Adam/epsilonConst*
valueB
 *wĢ+2*
dtype0
å
Joptimizer/Adam/update_policy/main_graph_0_encoder0/conv_1/kernel/ApplyAdam	ApplyAdam*policy/main_graph_0_encoder0/conv_1/kernel:optimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam<optimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam_1optimizer/beta1_power/readoptimizer/beta2_power/readoptimizer/PolynomialDecayoptimizer/Adam/beta1optimizer/Adam/beta2optimizer/Adam/epsilon`optimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/Conv2D_grad/tuple/control_dependency_1*
use_locking( *
T0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_1/kernel*
use_nesterov( 
Ü
Hoptimizer/Adam/update_policy/main_graph_0_encoder0/conv_1/bias/ApplyAdam	ApplyAdam(policy/main_graph_0_encoder0/conv_1/bias8optimizer//policy/main_graph_0_encoder0/conv_1/bias/Adam:optimizer//policy/main_graph_0_encoder0/conv_1/bias/Adam_1optimizer/beta1_power/readoptimizer/beta2_power/readoptimizer/PolynomialDecayoptimizer/Adam/beta1optimizer/Adam/beta2optimizer/Adam/epsilonaoptimizer/gradients_1/policy/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_1/bias*
use_nesterov( 
å
Joptimizer/Adam/update_policy/main_graph_0_encoder0/conv_2/kernel/ApplyAdam	ApplyAdam*policy/main_graph_0_encoder0/conv_2/kernel:optimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam<optimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam_1optimizer/beta1_power/readoptimizer/beta2_power/readoptimizer/PolynomialDecayoptimizer/Adam/beta1optimizer/Adam/beta2optimizer/Adam/epsilon`optimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/Conv2D_grad/tuple/control_dependency_1*
use_locking( *
T0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_2/kernel*
use_nesterov( 
Ü
Hoptimizer/Adam/update_policy/main_graph_0_encoder0/conv_2/bias/ApplyAdam	ApplyAdam(policy/main_graph_0_encoder0/conv_2/bias8optimizer//policy/main_graph_0_encoder0/conv_2/bias/Adam:optimizer//policy/main_graph_0_encoder0/conv_2/bias/Adam_1optimizer/beta1_power/readoptimizer/beta2_power/readoptimizer/PolynomialDecayoptimizer/Adam/beta1optimizer/Adam/beta2optimizer/Adam/epsilonaoptimizer/gradients_1/policy/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/control_dependency_1*
use_nesterov( *
use_locking( *
T0*;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_2/bias
Ź
poptimizer/Adam/update_policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/ApplyAdam	ApplyAdamPpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adamboptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1optimizer/beta1_power/readoptimizer/beta2_power/readoptimizer/PolynomialDecayoptimizer/Adam/beta1optimizer/Adam/beta2optimizer/Adam/epsilonoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/tuple/control_dependency_1*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
use_nesterov( *
use_locking( *
T0
Į
noptimizer/Adam/update_policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/ApplyAdam	ApplyAdamNpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias^optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam_1optimizer/beta1_power/readoptimizer/beta2_power/readoptimizer/PolynomialDecayoptimizer/Adam/beta1optimizer/Adam/beta2optimizer/Adam/epsilonoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias*
use_nesterov( 
Ź
poptimizer/Adam/update_policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/ApplyAdam	ApplyAdamPpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adamboptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1optimizer/beta1_power/readoptimizer/beta2_power/readoptimizer/PolynomialDecayoptimizer/Adam/beta1optimizer/Adam/beta2optimizer/Adam/epsilonoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/control_dependency_1*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
use_nesterov( *
use_locking( *
T0
Į
noptimizer/Adam/update_policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/ApplyAdam	ApplyAdamNpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias^optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam_1optimizer/beta1_power/readoptimizer/beta2_power/readoptimizer/PolynomialDecayoptimizer/Adam/beta1optimizer/Adam/beta2optimizer/Adam/epsilonoptimizer/gradients_1/policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/control_dependency_1*a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias*
use_nesterov( *
use_locking( *
T0
Ż
3optimizer/Adam/update_policy/dense/kernel/ApplyAdam	ApplyAdampolicy/dense/kernel#optimizer//policy/dense/kernel/Adam%optimizer//policy/dense/kernel/Adam_1optimizer/beta1_power/readoptimizer/beta2_power/readoptimizer/PolynomialDecayoptimizer/Adam/beta1optimizer/Adam/beta2optimizer/Adam/epsilonKoptimizer/gradients_1/policy_1/dense/MatMul_grad/tuple/control_dependency_1*
use_nesterov( *
use_locking( *
T0*&
_class
loc:@policy/dense/kernel
ü
Noptimizer/Adam/update_optimizer//main_graph_0_encoder0/conv_1/kernel/ApplyAdam	ApplyAdam.optimizer//main_graph_0_encoder0/conv_1/kernel>optimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam@optimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam_1optimizer/beta1_power/readoptimizer/beta2_power/readoptimizer/PolynomialDecayoptimizer/Adam/beta1optimizer/Adam/beta2optimizer/Adam/epsiloncoptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/Conv2D_grad/tuple/control_dependency_1*
use_locking( *
T0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_1/kernel*
use_nesterov( 
ó
Loptimizer/Adam/update_optimizer//main_graph_0_encoder0/conv_1/bias/ApplyAdam	ApplyAdam,optimizer//main_graph_0_encoder0/conv_1/bias<optimizer//optimizer//main_graph_0_encoder0/conv_1/bias/Adam>optimizer//optimizer//main_graph_0_encoder0/conv_1/bias/Adam_1optimizer/beta1_power/readoptimizer/beta2_power/readoptimizer/PolynomialDecayoptimizer/Adam/beta1optimizer/Adam/beta2optimizer/Adam/epsilondoptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_1/BiasAdd_grad/tuple/control_dependency_1*
T0*?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_1/bias*
use_nesterov( *
use_locking( 
ü
Noptimizer/Adam/update_optimizer//main_graph_0_encoder0/conv_2/kernel/ApplyAdam	ApplyAdam.optimizer//main_graph_0_encoder0/conv_2/kernel>optimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam@optimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam_1optimizer/beta1_power/readoptimizer/beta2_power/readoptimizer/PolynomialDecayoptimizer/Adam/beta1optimizer/Adam/beta2optimizer/Adam/epsiloncoptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/Conv2D_grad/tuple/control_dependency_1*
use_locking( *
T0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_2/kernel*
use_nesterov( 
ó
Loptimizer/Adam/update_optimizer//main_graph_0_encoder0/conv_2/bias/ApplyAdam	ApplyAdam,optimizer//main_graph_0_encoder0/conv_2/bias<optimizer//optimizer//main_graph_0_encoder0/conv_2/bias/Adam>optimizer//optimizer//main_graph_0_encoder0/conv_2/bias/Adam_1optimizer/beta1_power/readoptimizer/beta2_power/readoptimizer/PolynomialDecayoptimizer/Adam/beta1optimizer/Adam/beta2optimizer/Adam/epsilondoptimizer/gradients_1/optimizer/main_graph_0_encoder0/conv_2/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_2/bias*
use_nesterov( 
į
toptimizer/Adam/update_optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/ApplyAdam	ApplyAdamToptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kerneldoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adamfoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1optimizer/beta1_power/readoptimizer/beta2_power/readoptimizer/PolynomialDecayoptimizer/Adam/beta1optimizer/Adam/beta2optimizer/Adam/epsilonoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
use_nesterov( 
Ų
roptimizer/Adam/update_optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/ApplyAdam	ApplyAdamRoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/biasboptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adamdoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam_1optimizer/beta1_power/readoptimizer/beta2_power/readoptimizer/PolynomialDecayoptimizer/Adam/beta1optimizer/Adam/beta2optimizer/Adam/epsilonoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias*
use_nesterov( 
į
toptimizer/Adam/update_optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/ApplyAdam	ApplyAdamToptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kerneldoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adamfoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1optimizer/beta1_power/readoptimizer/beta2_power/readoptimizer/PolynomialDecayoptimizer/Adam/beta1optimizer/Adam/beta2optimizer/Adam/epsilonoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
use_nesterov( 
Ų
roptimizer/Adam/update_optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/ApplyAdam	ApplyAdamRoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/biasboptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adamdoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam_1optimizer/beta1_power/readoptimizer/beta2_power/readoptimizer/PolynomialDecayoptimizer/Adam/beta1optimizer/Adam/beta2optimizer/Adam/epsilonoptimizer/gradients_1/optimizer/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias*
use_nesterov( 
®
Aoptimizer/Adam/update_optimizer//extrinsic_value/kernel/ApplyAdam	ApplyAdam!optimizer//extrinsic_value/kernel1optimizer//optimizer//extrinsic_value/kernel/Adam3optimizer//optimizer//extrinsic_value/kernel/Adam_1optimizer/beta1_power/readoptimizer/beta2_power/readoptimizer/PolynomialDecayoptimizer/Adam/beta1optimizer/Adam/beta2optimizer/Adam/epsilonVoptimizer/gradients_1/optimizer/extrinsic_value/MatMul_grad/tuple/control_dependency_1*
use_nesterov( *
use_locking( *
T0*4
_class*
(&loc:@optimizer//extrinsic_value/kernel
„
?optimizer/Adam/update_optimizer//extrinsic_value/bias/ApplyAdam	ApplyAdamoptimizer//extrinsic_value/bias/optimizer//optimizer//extrinsic_value/bias/Adam1optimizer//optimizer//extrinsic_value/bias/Adam_1optimizer/beta1_power/readoptimizer/beta2_power/readoptimizer/PolynomialDecayoptimizer/Adam/beta1optimizer/Adam/beta2optimizer/Adam/epsilonWoptimizer/gradients_1/optimizer/extrinsic_value/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*2
_class(
&$loc:@optimizer//extrinsic_value/bias*
use_nesterov( 
Ō
optimizer/Adam/mulMuloptimizer/beta1_power/readoptimizer/Adam/beta1@^optimizer/Adam/update_optimizer//extrinsic_value/bias/ApplyAdamB^optimizer/Adam/update_optimizer//extrinsic_value/kernel/ApplyAdamM^optimizer/Adam/update_optimizer//main_graph_0_encoder0/conv_1/bias/ApplyAdamO^optimizer/Adam/update_optimizer//main_graph_0_encoder0/conv_1/kernel/ApplyAdamM^optimizer/Adam/update_optimizer//main_graph_0_encoder0/conv_2/bias/ApplyAdamO^optimizer/Adam/update_optimizer//main_graph_0_encoder0/conv_2/kernel/ApplyAdams^optimizer/Adam/update_optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/ApplyAdamu^optimizer/Adam/update_optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/ApplyAdams^optimizer/Adam/update_optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/ApplyAdamu^optimizer/Adam/update_optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/ApplyAdam4^optimizer/Adam/update_policy/dense/kernel/ApplyAdamI^optimizer/Adam/update_policy/main_graph_0_encoder0/conv_1/bias/ApplyAdamK^optimizer/Adam/update_policy/main_graph_0_encoder0/conv_1/kernel/ApplyAdamI^optimizer/Adam/update_policy/main_graph_0_encoder0/conv_2/bias/ApplyAdamK^optimizer/Adam/update_policy/main_graph_0_encoder0/conv_2/kernel/ApplyAdamo^optimizer/Adam/update_policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/ApplyAdamq^optimizer/Adam/update_policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/ApplyAdamo^optimizer/Adam/update_policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/ApplyAdamq^optimizer/Adam/update_policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/ApplyAdam*
T0*2
_class(
&$loc:@optimizer//extrinsic_value/bias
°
optimizer/Adam/AssignAssignoptimizer/beta1_poweroptimizer/Adam/mul*
use_locking( *
T0*2
_class(
&$loc:@optimizer//extrinsic_value/bias*
validate_shape(
Ö
optimizer/Adam/mul_1Muloptimizer/beta2_power/readoptimizer/Adam/beta2@^optimizer/Adam/update_optimizer//extrinsic_value/bias/ApplyAdamB^optimizer/Adam/update_optimizer//extrinsic_value/kernel/ApplyAdamM^optimizer/Adam/update_optimizer//main_graph_0_encoder0/conv_1/bias/ApplyAdamO^optimizer/Adam/update_optimizer//main_graph_0_encoder0/conv_1/kernel/ApplyAdamM^optimizer/Adam/update_optimizer//main_graph_0_encoder0/conv_2/bias/ApplyAdamO^optimizer/Adam/update_optimizer//main_graph_0_encoder0/conv_2/kernel/ApplyAdams^optimizer/Adam/update_optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/ApplyAdamu^optimizer/Adam/update_optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/ApplyAdams^optimizer/Adam/update_optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/ApplyAdamu^optimizer/Adam/update_optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/ApplyAdam4^optimizer/Adam/update_policy/dense/kernel/ApplyAdamI^optimizer/Adam/update_policy/main_graph_0_encoder0/conv_1/bias/ApplyAdamK^optimizer/Adam/update_policy/main_graph_0_encoder0/conv_1/kernel/ApplyAdamI^optimizer/Adam/update_policy/main_graph_0_encoder0/conv_2/bias/ApplyAdamK^optimizer/Adam/update_policy/main_graph_0_encoder0/conv_2/kernel/ApplyAdamo^optimizer/Adam/update_policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/ApplyAdamq^optimizer/Adam/update_policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/ApplyAdamo^optimizer/Adam/update_policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/ApplyAdamq^optimizer/Adam/update_policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/ApplyAdam*
T0*2
_class(
&$loc:@optimizer//extrinsic_value/bias
“
optimizer/Adam/Assign_1Assignoptimizer/beta2_poweroptimizer/Adam/mul_1*
validate_shape(*
use_locking( *
T0*2
_class(
&$loc:@optimizer//extrinsic_value/bias

optimizer/AdamNoOp^optimizer/Adam/Assign^optimizer/Adam/Assign_1@^optimizer/Adam/update_optimizer//extrinsic_value/bias/ApplyAdamB^optimizer/Adam/update_optimizer//extrinsic_value/kernel/ApplyAdamM^optimizer/Adam/update_optimizer//main_graph_0_encoder0/conv_1/bias/ApplyAdamO^optimizer/Adam/update_optimizer//main_graph_0_encoder0/conv_1/kernel/ApplyAdamM^optimizer/Adam/update_optimizer//main_graph_0_encoder0/conv_2/bias/ApplyAdamO^optimizer/Adam/update_optimizer//main_graph_0_encoder0/conv_2/kernel/ApplyAdams^optimizer/Adam/update_optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/ApplyAdamu^optimizer/Adam/update_optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/ApplyAdams^optimizer/Adam/update_optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/ApplyAdamu^optimizer/Adam/update_optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/ApplyAdam4^optimizer/Adam/update_policy/dense/kernel/ApplyAdamI^optimizer/Adam/update_policy/main_graph_0_encoder0/conv_1/bias/ApplyAdamK^optimizer/Adam/update_policy/main_graph_0_encoder0/conv_1/kernel/ApplyAdamI^optimizer/Adam/update_policy/main_graph_0_encoder0/conv_2/bias/ApplyAdamK^optimizer/Adam/update_policy/main_graph_0_encoder0/conv_2/kernel/ApplyAdamo^optimizer/Adam/update_policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/ApplyAdamq^optimizer/Adam/update_policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/ApplyAdamo^optimizer/Adam/update_policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/ApplyAdamq^optimizer/Adam/update_policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/ApplyAdam
C
save_1/filename/inputConst*
valueB Bmodel*
dtype0
Z
save_1/filenamePlaceholderWithDefaultsave_1/filename/input*
shape: *
dtype0
Q
save_1/ConstPlaceholderWithDefaultsave_1/filename*
shape: *
dtype0
×!
save_1/SaveV2/tensor_namesConst*¤!
value!B!FBaction_output_shapeBglobal_stepBis_continuous_controlBmemory_sizeBnormalization_stepsBoptimizer//extrinsic_value/biasB!optimizer//extrinsic_value/kernelB,optimizer//main_graph_0_encoder0/conv_1/biasB.optimizer//main_graph_0_encoder0/conv_1/kernelB,optimizer//main_graph_0_encoder0/conv_2/biasB.optimizer//main_graph_0_encoder0/conv_2/kernelBRoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/biasBToptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernelBRoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/biasBToptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernelB/optimizer//optimizer//extrinsic_value/bias/AdamB1optimizer//optimizer//extrinsic_value/bias/Adam_1B1optimizer//optimizer//extrinsic_value/kernel/AdamB3optimizer//optimizer//extrinsic_value/kernel/Adam_1B<optimizer//optimizer//main_graph_0_encoder0/conv_1/bias/AdamB>optimizer//optimizer//main_graph_0_encoder0/conv_1/bias/Adam_1B>optimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/AdamB@optimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam_1B<optimizer//optimizer//main_graph_0_encoder0/conv_2/bias/AdamB>optimizer//optimizer//main_graph_0_encoder0/conv_2/bias/Adam_1B>optimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/AdamB@optimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam_1Bboptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/AdamBdoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam_1Bdoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/AdamBfoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1Bboptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/AdamBdoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam_1Bdoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/AdamBfoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1B#optimizer//policy/dense/kernel/AdamB%optimizer//policy/dense/kernel/Adam_1B8optimizer//policy/main_graph_0_encoder0/conv_1/bias/AdamB:optimizer//policy/main_graph_0_encoder0/conv_1/bias/Adam_1B:optimizer//policy/main_graph_0_encoder0/conv_1/kernel/AdamB<optimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam_1B8optimizer//policy/main_graph_0_encoder0/conv_2/bias/AdamB:optimizer//policy/main_graph_0_encoder0/conv_2/bias/Adam_1B:optimizer//policy/main_graph_0_encoder0/conv_2/kernel/AdamB<optimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam_1B^optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/AdamB`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam_1B`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/AdamBboptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1B^optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/AdamB`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam_1B`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/AdamBboptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1Boptimizer/beta1_powerBoptimizer/beta2_powerBpolicy/dense/kernelB(policy/main_graph_0_encoder0/conv_1/biasB*policy/main_graph_0_encoder0/conv_1/kernelB(policy/main_graph_0_encoder0/conv_2/biasB*policy/main_graph_0_encoder0/conv_2/kernelBNpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/biasBPpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernelBNpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/biasBPpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernelBrunning_meanBrunning_varianceBtrainer_major_versionBtrainer_minor_versionBtrainer_patch_versionBversion_number*
dtype0
Ų
save_1/SaveV2/shape_and_slicesConst*”
valueBFB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0
Ę"
save_1/SaveV2SaveV2save_1/Constsave_1/SaveV2/tensor_namessave_1/SaveV2/shape_and_slicesaction_output_shapeglobal_stepis_continuous_controlmemory_sizenormalization_stepsoptimizer//extrinsic_value/bias!optimizer//extrinsic_value/kernel,optimizer//main_graph_0_encoder0/conv_1/bias.optimizer//main_graph_0_encoder0/conv_1/kernel,optimizer//main_graph_0_encoder0/conv_2/bias.optimizer//main_graph_0_encoder0/conv_2/kernelRoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/biasToptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernelRoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/biasToptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/optimizer//optimizer//extrinsic_value/bias/Adam1optimizer//optimizer//extrinsic_value/bias/Adam_11optimizer//optimizer//extrinsic_value/kernel/Adam3optimizer//optimizer//extrinsic_value/kernel/Adam_1<optimizer//optimizer//main_graph_0_encoder0/conv_1/bias/Adam>optimizer//optimizer//main_graph_0_encoder0/conv_1/bias/Adam_1>optimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam@optimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam_1<optimizer//optimizer//main_graph_0_encoder0/conv_2/bias/Adam>optimizer//optimizer//main_graph_0_encoder0/conv_2/bias/Adam_1>optimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam@optimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam_1boptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adamdoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam_1doptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adamfoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1boptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adamdoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam_1doptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adamfoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1#optimizer//policy/dense/kernel/Adam%optimizer//policy/dense/kernel/Adam_18optimizer//policy/main_graph_0_encoder0/conv_1/bias/Adam:optimizer//policy/main_graph_0_encoder0/conv_1/bias/Adam_1:optimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam<optimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam_18optimizer//policy/main_graph_0_encoder0/conv_2/bias/Adam:optimizer//policy/main_graph_0_encoder0/conv_2/bias/Adam_1:optimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam<optimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam_1^optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam_1`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adamboptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1^optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam_1`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adamboptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1optimizer/beta1_poweroptimizer/beta2_powerpolicy/dense/kernel(policy/main_graph_0_encoder0/conv_1/bias*policy/main_graph_0_encoder0/conv_1/kernel(policy/main_graph_0_encoder0/conv_2/bias*policy/main_graph_0_encoder0/conv_2/kernelNpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/biasPpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernelNpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/biasPpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernelrunning_meanrunning_variancetrainer_major_versiontrainer_minor_versiontrainer_patch_versionversion_number*T
dtypesJ
H2F
m
save_1/control_dependencyIdentitysave_1/Const^save_1/SaveV2*
_class
loc:@save_1/Const*
T0
é!
save_1/RestoreV2/tensor_namesConst"/device:CPU:0*¤!
value!B!FBaction_output_shapeBglobal_stepBis_continuous_controlBmemory_sizeBnormalization_stepsBoptimizer//extrinsic_value/biasB!optimizer//extrinsic_value/kernelB,optimizer//main_graph_0_encoder0/conv_1/biasB.optimizer//main_graph_0_encoder0/conv_1/kernelB,optimizer//main_graph_0_encoder0/conv_2/biasB.optimizer//main_graph_0_encoder0/conv_2/kernelBRoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/biasBToptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernelBRoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/biasBToptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernelB/optimizer//optimizer//extrinsic_value/bias/AdamB1optimizer//optimizer//extrinsic_value/bias/Adam_1B1optimizer//optimizer//extrinsic_value/kernel/AdamB3optimizer//optimizer//extrinsic_value/kernel/Adam_1B<optimizer//optimizer//main_graph_0_encoder0/conv_1/bias/AdamB>optimizer//optimizer//main_graph_0_encoder0/conv_1/bias/Adam_1B>optimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/AdamB@optimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam_1B<optimizer//optimizer//main_graph_0_encoder0/conv_2/bias/AdamB>optimizer//optimizer//main_graph_0_encoder0/conv_2/bias/Adam_1B>optimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/AdamB@optimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam_1Bboptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/AdamBdoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam_1Bdoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/AdamBfoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1Bboptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/AdamBdoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam_1Bdoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/AdamBfoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1B#optimizer//policy/dense/kernel/AdamB%optimizer//policy/dense/kernel/Adam_1B8optimizer//policy/main_graph_0_encoder0/conv_1/bias/AdamB:optimizer//policy/main_graph_0_encoder0/conv_1/bias/Adam_1B:optimizer//policy/main_graph_0_encoder0/conv_1/kernel/AdamB<optimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam_1B8optimizer//policy/main_graph_0_encoder0/conv_2/bias/AdamB:optimizer//policy/main_graph_0_encoder0/conv_2/bias/Adam_1B:optimizer//policy/main_graph_0_encoder0/conv_2/kernel/AdamB<optimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam_1B^optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/AdamB`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam_1B`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/AdamBboptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1B^optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/AdamB`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam_1B`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/AdamBboptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1Boptimizer/beta1_powerBoptimizer/beta2_powerBpolicy/dense/kernelB(policy/main_graph_0_encoder0/conv_1/biasB*policy/main_graph_0_encoder0/conv_1/kernelB(policy/main_graph_0_encoder0/conv_2/biasB*policy/main_graph_0_encoder0/conv_2/kernelBNpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/biasBPpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernelBNpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/biasBPpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernelBrunning_meanBrunning_varianceBtrainer_major_versionBtrainer_minor_versionBtrainer_patch_versionBversion_number*
dtype0
ź
!save_1/RestoreV2/shape_and_slicesConst"/device:CPU:0*”
valueBFB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0
Ņ
save_1/RestoreV2	RestoreV2save_1/Constsave_1/RestoreV2/tensor_names!save_1/RestoreV2/shape_and_slices"/device:CPU:0*T
dtypesJ
H2F

save_1/AssignAssignaction_output_shapesave_1/RestoreV2*
use_locking(*
T0*&
_class
loc:@action_output_shape*
validate_shape(

save_1/Assign_1Assignglobal_stepsave_1/RestoreV2:1*
use_locking(*
T0*
_class
loc:@global_step*
validate_shape(
 
save_1/Assign_2Assignis_continuous_controlsave_1/RestoreV2:2*
use_locking(*
T0*(
_class
loc:@is_continuous_control*
validate_shape(

save_1/Assign_3Assignmemory_sizesave_1/RestoreV2:3*
use_locking(*
T0*
_class
loc:@memory_size*
validate_shape(

save_1/Assign_4Assignnormalization_stepssave_1/RestoreV2:4*
use_locking(*
T0*&
_class
loc:@normalization_steps*
validate_shape(
“
save_1/Assign_5Assignoptimizer//extrinsic_value/biassave_1/RestoreV2:5*
validate_shape(*
use_locking(*
T0*2
_class(
&$loc:@optimizer//extrinsic_value/bias
ø
save_1/Assign_6Assign!optimizer//extrinsic_value/kernelsave_1/RestoreV2:6*
use_locking(*
T0*4
_class*
(&loc:@optimizer//extrinsic_value/kernel*
validate_shape(
Ī
save_1/Assign_7Assign,optimizer//main_graph_0_encoder0/conv_1/biassave_1/RestoreV2:7*
use_locking(*
T0*?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_1/bias*
validate_shape(
Ņ
save_1/Assign_8Assign.optimizer//main_graph_0_encoder0/conv_1/kernelsave_1/RestoreV2:8*
use_locking(*
T0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_1/kernel*
validate_shape(
Ī
save_1/Assign_9Assign,optimizer//main_graph_0_encoder0/conv_2/biassave_1/RestoreV2:9*
use_locking(*
T0*?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_2/bias*
validate_shape(
Ō
save_1/Assign_10Assign.optimizer//main_graph_0_encoder0/conv_2/kernelsave_1/RestoreV2:10*
use_locking(*
T0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_2/kernel*
validate_shape(

save_1/Assign_11AssignRoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/biassave_1/RestoreV2:11*
use_locking(*
T0*e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias*
validate_shape(
 
save_1/Assign_12AssignToptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernelsave_1/RestoreV2:12*
use_locking(*
T0*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
validate_shape(

save_1/Assign_13AssignRoptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/biassave_1/RestoreV2:13*
T0*e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias*
validate_shape(*
use_locking(
 
save_1/Assign_14AssignToptimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernelsave_1/RestoreV2:14*
validate_shape(*
use_locking(*
T0*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel
Ę
save_1/Assign_15Assign/optimizer//optimizer//extrinsic_value/bias/Adamsave_1/RestoreV2:15*
validate_shape(*
use_locking(*
T0*2
_class(
&$loc:@optimizer//extrinsic_value/bias
Č
save_1/Assign_16Assign1optimizer//optimizer//extrinsic_value/bias/Adam_1save_1/RestoreV2:16*
validate_shape(*
use_locking(*
T0*2
_class(
&$loc:@optimizer//extrinsic_value/bias
Ź
save_1/Assign_17Assign1optimizer//optimizer//extrinsic_value/kernel/Adamsave_1/RestoreV2:17*
T0*4
_class*
(&loc:@optimizer//extrinsic_value/kernel*
validate_shape(*
use_locking(
Ģ
save_1/Assign_18Assign3optimizer//optimizer//extrinsic_value/kernel/Adam_1save_1/RestoreV2:18*4
_class*
(&loc:@optimizer//extrinsic_value/kernel*
validate_shape(*
use_locking(*
T0
ą
save_1/Assign_19Assign<optimizer//optimizer//main_graph_0_encoder0/conv_1/bias/Adamsave_1/RestoreV2:19*
use_locking(*
T0*?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_1/bias*
validate_shape(
ā
save_1/Assign_20Assign>optimizer//optimizer//main_graph_0_encoder0/conv_1/bias/Adam_1save_1/RestoreV2:20*
use_locking(*
T0*?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_1/bias*
validate_shape(
ä
save_1/Assign_21Assign>optimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adamsave_1/RestoreV2:21*
validate_shape(*
use_locking(*
T0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_1/kernel
ę
save_1/Assign_22Assign@optimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam_1save_1/RestoreV2:22*
use_locking(*
T0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_1/kernel*
validate_shape(
ą
save_1/Assign_23Assign<optimizer//optimizer//main_graph_0_encoder0/conv_2/bias/Adamsave_1/RestoreV2:23*
use_locking(*
T0*?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_2/bias*
validate_shape(
ā
save_1/Assign_24Assign>optimizer//optimizer//main_graph_0_encoder0/conv_2/bias/Adam_1save_1/RestoreV2:24*
use_locking(*
T0*?
_class5
31loc:@optimizer//main_graph_0_encoder0/conv_2/bias*
validate_shape(
ä
save_1/Assign_25Assign>optimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adamsave_1/RestoreV2:25*
use_locking(*
T0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_2/kernel*
validate_shape(
ę
save_1/Assign_26Assign@optimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam_1save_1/RestoreV2:26*
use_locking(*
T0*A
_class7
53loc:@optimizer//main_graph_0_encoder0/conv_2/kernel*
validate_shape(
¬
save_1/Assign_27Assignboptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adamsave_1/RestoreV2:27*
T0*e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias*
validate_shape(*
use_locking(
®
save_1/Assign_28Assigndoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam_1save_1/RestoreV2:28*
use_locking(*
T0*e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias*
validate_shape(
°
save_1/Assign_29Assigndoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adamsave_1/RestoreV2:29*
use_locking(*
T0*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
validate_shape(
²
save_1/Assign_30Assignfoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1save_1/RestoreV2:30*
use_locking(*
T0*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
validate_shape(
¬
save_1/Assign_31Assignboptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adamsave_1/RestoreV2:31*e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias*
validate_shape(*
use_locking(*
T0
®
save_1/Assign_32Assigndoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam_1save_1/RestoreV2:32*
use_locking(*
T0*e
_class[
YWloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias*
validate_shape(
°
save_1/Assign_33Assigndoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adamsave_1/RestoreV2:33*
use_locking(*
T0*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
validate_shape(
²
save_1/Assign_34Assignfoptimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1save_1/RestoreV2:34*
use_locking(*
T0*g
_class]
[Yloc:@optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
validate_shape(
®
save_1/Assign_35Assign#optimizer//policy/dense/kernel/Adamsave_1/RestoreV2:35*
validate_shape(*
use_locking(*
T0*&
_class
loc:@policy/dense/kernel
°
save_1/Assign_36Assign%optimizer//policy/dense/kernel/Adam_1save_1/RestoreV2:36*
T0*&
_class
loc:@policy/dense/kernel*
validate_shape(*
use_locking(
Ų
save_1/Assign_37Assign8optimizer//policy/main_graph_0_encoder0/conv_1/bias/Adamsave_1/RestoreV2:37*
use_locking(*
T0*;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_1/bias*
validate_shape(
Ś
save_1/Assign_38Assign:optimizer//policy/main_graph_0_encoder0/conv_1/bias/Adam_1save_1/RestoreV2:38*
use_locking(*
T0*;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_1/bias*
validate_shape(
Ü
save_1/Assign_39Assign:optimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adamsave_1/RestoreV2:39*
use_locking(*
T0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_1/kernel*
validate_shape(
Ž
save_1/Assign_40Assign<optimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam_1save_1/RestoreV2:40*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_1/kernel*
validate_shape(*
use_locking(*
T0
Ų
save_1/Assign_41Assign8optimizer//policy/main_graph_0_encoder0/conv_2/bias/Adamsave_1/RestoreV2:41*
use_locking(*
T0*;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_2/bias*
validate_shape(
Ś
save_1/Assign_42Assign:optimizer//policy/main_graph_0_encoder0/conv_2/bias/Adam_1save_1/RestoreV2:42*
use_locking(*
T0*;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_2/bias*
validate_shape(
Ü
save_1/Assign_43Assign:optimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adamsave_1/RestoreV2:43*
use_locking(*
T0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_2/kernel*
validate_shape(
Ž
save_1/Assign_44Assign<optimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam_1save_1/RestoreV2:44*
use_locking(*
T0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_2/kernel*
validate_shape(
¤
save_1/Assign_45Assign^optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adamsave_1/RestoreV2:45*
use_locking(*
T0*a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias*
validate_shape(
¦
save_1/Assign_46Assign`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam_1save_1/RestoreV2:46*
T0*a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias*
validate_shape(*
use_locking(
Ø
save_1/Assign_47Assign`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adamsave_1/RestoreV2:47*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
validate_shape(*
use_locking(*
T0
Ŗ
save_1/Assign_48Assignboptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1save_1/RestoreV2:48*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
validate_shape(*
use_locking(*
T0
¤
save_1/Assign_49Assign^optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adamsave_1/RestoreV2:49*
validate_shape(*
use_locking(*
T0*a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias
¦
save_1/Assign_50Assign`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam_1save_1/RestoreV2:50*
use_locking(*
T0*a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias*
validate_shape(
Ø
save_1/Assign_51Assign`optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adamsave_1/RestoreV2:51*
use_locking(*
T0*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
validate_shape(
Ŗ
save_1/Assign_52Assignboptimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1save_1/RestoreV2:52*
use_locking(*
T0*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
validate_shape(
¬
save_1/Assign_53Assignoptimizer/beta1_powersave_1/RestoreV2:53*
use_locking(*
T0*2
_class(
&$loc:@optimizer//extrinsic_value/bias*
validate_shape(
¬
save_1/Assign_54Assignoptimizer/beta2_powersave_1/RestoreV2:54*
use_locking(*
T0*2
_class(
&$loc:@optimizer//extrinsic_value/bias*
validate_shape(

save_1/Assign_55Assignpolicy/dense/kernelsave_1/RestoreV2:55*
use_locking(*
T0*&
_class
loc:@policy/dense/kernel*
validate_shape(
Č
save_1/Assign_56Assign(policy/main_graph_0_encoder0/conv_1/biassave_1/RestoreV2:56*;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_1/bias*
validate_shape(*
use_locking(*
T0
Ģ
save_1/Assign_57Assign*policy/main_graph_0_encoder0/conv_1/kernelsave_1/RestoreV2:57*
validate_shape(*
use_locking(*
T0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_1/kernel
Č
save_1/Assign_58Assign(policy/main_graph_0_encoder0/conv_2/biassave_1/RestoreV2:58*
use_locking(*
T0*;
_class1
/-loc:@policy/main_graph_0_encoder0/conv_2/bias*
validate_shape(
Ģ
save_1/Assign_59Assign*policy/main_graph_0_encoder0/conv_2/kernelsave_1/RestoreV2:59*
T0*=
_class3
1/loc:@policy/main_graph_0_encoder0/conv_2/kernel*
validate_shape(*
use_locking(

save_1/Assign_60AssignNpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/biassave_1/RestoreV2:60*
validate_shape(*
use_locking(*
T0*a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias

save_1/Assign_61AssignPpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernelsave_1/RestoreV2:61*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel*
validate_shape(*
use_locking(*
T0

save_1/Assign_62AssignNpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/biassave_1/RestoreV2:62*
use_locking(*
T0*a
_classW
USloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias*
validate_shape(

save_1/Assign_63AssignPpolicy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernelsave_1/RestoreV2:63*
use_locking(*
T0*c
_classY
WUloc:@policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel*
validate_shape(

save_1/Assign_64Assignrunning_meansave_1/RestoreV2:64*
_class
loc:@running_mean*
validate_shape(*
use_locking(*
T0

save_1/Assign_65Assignrunning_variancesave_1/RestoreV2:65*
use_locking(*
T0*#
_class
loc:@running_variance*
validate_shape(
¢
save_1/Assign_66Assigntrainer_major_versionsave_1/RestoreV2:66*
use_locking(*
T0*(
_class
loc:@trainer_major_version*
validate_shape(
¢
save_1/Assign_67Assigntrainer_minor_versionsave_1/RestoreV2:67*
T0*(
_class
loc:@trainer_minor_version*
validate_shape(*
use_locking(
¢
save_1/Assign_68Assigntrainer_patch_versionsave_1/RestoreV2:68*
use_locking(*
T0*(
_class
loc:@trainer_patch_version*
validate_shape(

save_1/Assign_69Assignversion_numbersave_1/RestoreV2:69*
use_locking(*
T0*!
_class
loc:@version_number*
validate_shape(
Ą

save_1/restore_allNoOp^save_1/Assign^save_1/Assign_1^save_1/Assign_10^save_1/Assign_11^save_1/Assign_12^save_1/Assign_13^save_1/Assign_14^save_1/Assign_15^save_1/Assign_16^save_1/Assign_17^save_1/Assign_18^save_1/Assign_19^save_1/Assign_2^save_1/Assign_20^save_1/Assign_21^save_1/Assign_22^save_1/Assign_23^save_1/Assign_24^save_1/Assign_25^save_1/Assign_26^save_1/Assign_27^save_1/Assign_28^save_1/Assign_29^save_1/Assign_3^save_1/Assign_30^save_1/Assign_31^save_1/Assign_32^save_1/Assign_33^save_1/Assign_34^save_1/Assign_35^save_1/Assign_36^save_1/Assign_37^save_1/Assign_38^save_1/Assign_39^save_1/Assign_4^save_1/Assign_40^save_1/Assign_41^save_1/Assign_42^save_1/Assign_43^save_1/Assign_44^save_1/Assign_45^save_1/Assign_46^save_1/Assign_47^save_1/Assign_48^save_1/Assign_49^save_1/Assign_5^save_1/Assign_50^save_1/Assign_51^save_1/Assign_52^save_1/Assign_53^save_1/Assign_54^save_1/Assign_55^save_1/Assign_56^save_1/Assign_57^save_1/Assign_58^save_1/Assign_59^save_1/Assign_6^save_1/Assign_60^save_1/Assign_61^save_1/Assign_62^save_1/Assign_63^save_1/Assign_64^save_1/Assign_65^save_1/Assign_66^save_1/Assign_67^save_1/Assign_68^save_1/Assign_69^save_1/Assign_7^save_1/Assign_8^save_1/Assign_9
Ķ%
init_1NoOp^action_output_shape/Assign^global_step/Assign^is_continuous_control/Assign^memory_size/Assign^normalization_steps/Assign'^optimizer//extrinsic_value/bias/Assign)^optimizer//extrinsic_value/kernel/Assign4^optimizer//main_graph_0_encoder0/conv_1/bias/Assign6^optimizer//main_graph_0_encoder0/conv_1/kernel/Assign4^optimizer//main_graph_0_encoder0/conv_2/bias/Assign6^optimizer//main_graph_0_encoder0/conv_2/kernel/AssignZ^optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Assign\^optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/AssignZ^optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Assign\^optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Assign7^optimizer//optimizer//extrinsic_value/bias/Adam/Assign9^optimizer//optimizer//extrinsic_value/bias/Adam_1/Assign9^optimizer//optimizer//extrinsic_value/kernel/Adam/Assign;^optimizer//optimizer//extrinsic_value/kernel/Adam_1/AssignD^optimizer//optimizer//main_graph_0_encoder0/conv_1/bias/Adam/AssignF^optimizer//optimizer//main_graph_0_encoder0/conv_1/bias/Adam_1/AssignF^optimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam/AssignH^optimizer//optimizer//main_graph_0_encoder0/conv_1/kernel/Adam_1/AssignD^optimizer//optimizer//main_graph_0_encoder0/conv_2/bias/Adam/AssignF^optimizer//optimizer//main_graph_0_encoder0/conv_2/bias/Adam_1/AssignF^optimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam/AssignH^optimizer//optimizer//main_graph_0_encoder0/conv_2/kernel/Adam_1/Assignj^optimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam/Assignl^optimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam_1/Assignl^optimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam/Assignn^optimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1/Assignj^optimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam/Assignl^optimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam_1/Assignl^optimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam/Assignn^optimizer//optimizer//main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1/Assign+^optimizer//policy/dense/kernel/Adam/Assign-^optimizer//policy/dense/kernel/Adam_1/Assign@^optimizer//policy/main_graph_0_encoder0/conv_1/bias/Adam/AssignB^optimizer//policy/main_graph_0_encoder0/conv_1/bias/Adam_1/AssignB^optimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam/AssignD^optimizer//policy/main_graph_0_encoder0/conv_1/kernel/Adam_1/Assign@^optimizer//policy/main_graph_0_encoder0/conv_2/bias/Adam/AssignB^optimizer//policy/main_graph_0_encoder0/conv_2/bias/Adam_1/AssignB^optimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam/AssignD^optimizer//policy/main_graph_0_encoder0/conv_2/kernel/Adam_1/Assignf^optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam/Assignh^optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/Adam_1/Assignh^optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam/Assignj^optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/Adam_1/Assignf^optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam/Assignh^optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/Adam_1/Assignh^optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam/Assignj^optimizer//policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Adam_1/Assign^optimizer/beta1_power/Assign^optimizer/beta2_power/Assign^policy/dense/kernel/Assign0^policy/main_graph_0_encoder0/conv_1/bias/Assign2^policy/main_graph_0_encoder0/conv_1/kernel/Assign0^policy/main_graph_0_encoder0/conv_2/bias/Assign2^policy/main_graph_0_encoder0/conv_2/kernel/AssignV^policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/bias/AssignX^policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_0/kernel/AssignV^policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/bias/AssignX^policy/main_graph_0_encoder0/flat_encoding/main_graph_0_encoder0/hidden_1/kernel/Assign^running_mean/Assign^running_variance/Assign^trainer_major_version/Assign^trainer_minor_version/Assign^trainer_patch_version/Assign^version_number/Assign"&