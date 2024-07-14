#include "kernel/types.h"
#include "user/user.h"
#include "user/list.h"
#include "user/threads.h"
#include "user/threads_sched.h"

#define NULL 0

/* default scheduling algorithm */
struct threads_sched_result schedule_default(struct threads_sched_args args)
{
    struct thread *thread_with_smallest_id = NULL;
    struct thread *th = NULL;
    list_for_each_entry(th, args.run_queue, thread_list) {
        if (thread_with_smallest_id == NULL || th->ID < thread_with_smallest_id->ID) {
            thread_with_smallest_id = th;
        }
    }

    struct threads_sched_result r;
    if (thread_with_smallest_id != NULL) {
        r.scheduled_thread_list_member = &thread_with_smallest_id->thread_list;
        r.allocated_time = thread_with_smallest_id->remaining_time;
    } else {
        r.scheduled_thread_list_member = args.run_queue;
        r.allocated_time = 1;
    }

    return r;

}

/* Earliest-Deadline-First scheduling */
struct threads_sched_result schedule_edf(struct threads_sched_args args)
{   
    int is_miss = 0;
    struct thread *tws_deadline = NULL, *tws_id = NULL;
    struct thread *th = NULL;
    
    list_for_each_entry(th, args.run_queue, thread_list) {
        if(args.current_time + th->remaining_time > th->current_deadline){
            is_miss = 1;
        }
        if (tws_deadline == NULL || (th->current_deadline < tws_deadline->current_deadline) || (th->current_deadline == tws_deadline->current_deadline && th->ID < tws_deadline->ID)) {
            tws_deadline = th;
        }
    }
    
    struct threads_sched_result r;
    if (tws_deadline != NULL) {
        if(!is_miss){
            r.scheduled_thread_list_member = &tws_deadline->thread_list;
            struct release_queue_entry *rth;
            struct thread *find = NULL;
            list_for_each_entry(rth, args.release_queue, thread_list){
                if (rth->thrd->current_deadline + rth->thrd->period < tws_deadline->current_deadline && (find == NULL || rth->thrd->current_deadline + rth->thrd->period < find->current_deadline + find->period)) {
                    find = rth->thrd;
                }
            }
            if(find == NULL || args.current_time + tws_deadline->remaining_time <= find->current_deadline) r.allocated_time = tws_deadline->remaining_time;
            else{
                //r.allocated_time = tws_deadline->remaining_time;
                r.allocated_time = find->current_deadline - args.current_time;
            }
        }
        else{
            list_for_each_entry(th, args.run_queue, thread_list) {
                if (tws_id == NULL || (args.current_time >= th->current_deadline && th->ID < tws_id->ID)) {
                    tws_id = th;
                }
            }
            r.scheduled_thread_list_member = &tws_id->thread_list;
            r.allocated_time = (tws_id->current_deadline - args.current_time < 0)? 0: tws_id->current_deadline - args.current_time;
        }
        
    } else {
        r.scheduled_thread_list_member = args.run_queue;
            struct release_queue_entry *rth;
            struct thread *find = NULL;
            list_for_each_entry(rth, args.release_queue, thread_list) {
            if (find == NULL || (rth->thrd->current_deadline < find->current_deadline)) {
                find = rth->thrd;
            }
        }
        r.allocated_time = find->current_deadline - args.current_time;
    }

    return r;
}

/* Rate-Monotonic Scheduling */
struct threads_sched_result schedule_rm(struct threads_sched_args args)
{
    int is_miss = 0;
    struct thread *tws_period = NULL, *tws_id = NULL;
    struct thread *th = NULL;
    list_for_each_entry(th, args.run_queue, thread_list) {
        if(args.current_time + th->remaining_time > th->current_deadline){
            is_miss = 1;
            //break;
        }
        if (tws_period == NULL || (th->period < tws_period->period) || (th->period == tws_period->period && th->ID < tws_period->ID)) {
            tws_period = th;
        }
    }

    struct threads_sched_result r; 
    if (tws_period != NULL) {
        if(!is_miss){
            r.scheduled_thread_list_member = &tws_period->thread_list;
            struct release_queue_entry *rth;
            struct thread *find = NULL;
            list_for_each_entry(rth, args.release_queue, thread_list){
                if(find == NULL || rth->thrd->current_deadline + rth->thrd->period < find->current_deadline + find->period) {
                    find = rth->thrd;
                }
            }
            if(find == NULL || args.current_time + tws_period->remaining_time <= find->current_deadline) r.allocated_time = tws_period->remaining_time;
            else{
                //r.allocated_time = tws_period->remaining_time;
                r.allocated_time = find->current_deadline - args.current_time;
            }
        }
        else{
            list_for_each_entry(th, args.run_queue, thread_list) {
                if (tws_id == NULL || (args.current_time >= th->current_deadline && th->ID < tws_id->ID)) {
                    tws_id = th;
                }
            }
            r.scheduled_thread_list_member = &tws_id->thread_list;
            r.allocated_time = (tws_id->current_deadline - args.current_time < 0)? 0: tws_id->current_deadline - args.current_time;
        }
    } else {
        r.scheduled_thread_list_member = args.run_queue;
            struct release_queue_entry *rth;
            struct thread *find = NULL;
            list_for_each_entry(rth, args.release_queue, thread_list) {
            if (find == NULL || (rth->thrd->period < find->period)) {
                find = rth->thrd;
            }
        }
        r.allocated_time = find->current_deadline - args.current_time;
    }

    return r;
}
