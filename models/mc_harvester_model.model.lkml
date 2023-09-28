connection: "mc_sql_looker"

# include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

include: "/views/dept.view.lkml"
include: "/views/emp_sal.view.lkml"
include: "/views/expence.view.lkml"
include: "/mc_harvester_dash.dashboard.lookml"

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.

explore: dept {
  join: emp_sal {
    type: left_outer
    relationship: many_to_one
    sql_on: ${emp_sal.id} = ${dept.emp_id} ;;
  }

  join: expence {
    type: left_outer
    relationship: many_to_one
    sql_on: ${expence.expid} = ${dept.emp_id} ;;
  }
}
