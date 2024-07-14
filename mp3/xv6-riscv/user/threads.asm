
user/_threads:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <__list_add>:
 * the prev/next entries already!
 */
static inline void __list_add(struct list_head *new_entry,
                              struct list_head *prev,
                              struct list_head *next)
{
       0:	7179                	addi	sp,sp,-48
       2:	f422                	sd	s0,40(sp)
       4:	1800                	addi	s0,sp,48
       6:	fea43423          	sd	a0,-24(s0)
       a:	feb43023          	sd	a1,-32(s0)
       e:	fcc43c23          	sd	a2,-40(s0)
    next->prev = new_entry;
      12:	fd843783          	ld	a5,-40(s0)
      16:	fe843703          	ld	a4,-24(s0)
      1a:	e798                	sd	a4,8(a5)
    new_entry->next = next;
      1c:	fe843783          	ld	a5,-24(s0)
      20:	fd843703          	ld	a4,-40(s0)
      24:	e398                	sd	a4,0(a5)
    new_entry->prev = prev;
      26:	fe843783          	ld	a5,-24(s0)
      2a:	fe043703          	ld	a4,-32(s0)
      2e:	e798                	sd	a4,8(a5)
    prev->next = new_entry;
      30:	fe043783          	ld	a5,-32(s0)
      34:	fe843703          	ld	a4,-24(s0)
      38:	e398                	sd	a4,0(a5)
}
      3a:	0001                	nop
      3c:	7422                	ld	s0,40(sp)
      3e:	6145                	addi	sp,sp,48
      40:	8082                	ret

0000000000000042 <list_add_tail>:
 *
 * Insert a new entry before the specified head.
 * This is useful for implementing queues.
 */
static inline void list_add_tail(struct list_head *new_entry, struct list_head *head)
{
      42:	1101                	addi	sp,sp,-32
      44:	ec06                	sd	ra,24(sp)
      46:	e822                	sd	s0,16(sp)
      48:	1000                	addi	s0,sp,32
      4a:	fea43423          	sd	a0,-24(s0)
      4e:	feb43023          	sd	a1,-32(s0)
    __list_add(new_entry, head->prev, head);
      52:	fe043783          	ld	a5,-32(s0)
      56:	679c                	ld	a5,8(a5)
      58:	fe043603          	ld	a2,-32(s0)
      5c:	85be                	mv	a1,a5
      5e:	fe843503          	ld	a0,-24(s0)
      62:	00000097          	auipc	ra,0x0
      66:	f9e080e7          	jalr	-98(ra) # 0 <__list_add>
}
      6a:	0001                	nop
      6c:	60e2                	ld	ra,24(sp)
      6e:	6442                	ld	s0,16(sp)
      70:	6105                	addi	sp,sp,32
      72:	8082                	ret

0000000000000074 <__list_del>:
 *
 * This is only for internal list manipulation where we know
 * the prev/next entries already!
 */
static inline void __list_del(struct list_head *prev, struct list_head *next)
{
      74:	1101                	addi	sp,sp,-32
      76:	ec22                	sd	s0,24(sp)
      78:	1000                	addi	s0,sp,32
      7a:	fea43423          	sd	a0,-24(s0)
      7e:	feb43023          	sd	a1,-32(s0)
    next->prev = prev;
      82:	fe043783          	ld	a5,-32(s0)
      86:	fe843703          	ld	a4,-24(s0)
      8a:	e798                	sd	a4,8(a5)
    prev->next = next;
      8c:	fe843783          	ld	a5,-24(s0)
      90:	fe043703          	ld	a4,-32(s0)
      94:	e398                	sd	a4,0(a5)
}
      96:	0001                	nop
      98:	6462                	ld	s0,24(sp)
      9a:	6105                	addi	sp,sp,32
      9c:	8082                	ret

000000000000009e <list_del>:
 * @entry: the element to delete from the list.
 * Note: list_empty on entry does not return true after this, the entry is
 * in an undefined state.
 */
static inline void list_del(struct list_head *entry)
{
      9e:	1101                	addi	sp,sp,-32
      a0:	ec06                	sd	ra,24(sp)
      a2:	e822                	sd	s0,16(sp)
      a4:	1000                	addi	s0,sp,32
      a6:	fea43423          	sd	a0,-24(s0)
    __list_del(entry->prev, entry->next);
      aa:	fe843783          	ld	a5,-24(s0)
      ae:	6798                	ld	a4,8(a5)
      b0:	fe843783          	ld	a5,-24(s0)
      b4:	639c                	ld	a5,0(a5)
      b6:	85be                	mv	a1,a5
      b8:	853a                	mv	a0,a4
      ba:	00000097          	auipc	ra,0x0
      be:	fba080e7          	jalr	-70(ra) # 74 <__list_del>
    entry->next = LIST_POISON1;
      c2:	fe843783          	ld	a5,-24(s0)
      c6:	00100737          	lui	a4,0x100
      ca:	10070713          	addi	a4,a4,256 # 100100 <__global_pointer$+0xfda08>
      ce:	e398                	sd	a4,0(a5)
    entry->prev = LIST_POISON2;
      d0:	fe843783          	ld	a5,-24(s0)
      d4:	00200737          	lui	a4,0x200
      d8:	20070713          	addi	a4,a4,512 # 200200 <__global_pointer$+0x1fdb08>
      dc:	e798                	sd	a4,8(a5)
}
      de:	0001                	nop
      e0:	60e2                	ld	ra,24(sp)
      e2:	6442                	ld	s0,16(sp)
      e4:	6105                	addi	sp,sp,32
      e6:	8082                	ret

00000000000000e8 <list_empty>:
/**
 * list_empty - tests whether a list is empty
 * @head: the list to test.
 */
static inline int list_empty(const struct list_head *head)
{
      e8:	1101                	addi	sp,sp,-32
      ea:	ec22                	sd	s0,24(sp)
      ec:	1000                	addi	s0,sp,32
      ee:	fea43423          	sd	a0,-24(s0)
    return head->next == head;
      f2:	fe843783          	ld	a5,-24(s0)
      f6:	639c                	ld	a5,0(a5)
      f8:	fe843703          	ld	a4,-24(s0)
      fc:	40f707b3          	sub	a5,a4,a5
     100:	0017b793          	seqz	a5,a5
     104:	0ff7f793          	andi	a5,a5,255
     108:	2781                	sext.w	a5,a5
}
     10a:	853e                	mv	a0,a5
     10c:	6462                	ld	s0,24(sp)
     10e:	6105                	addi	sp,sp,32
     110:	8082                	ret

0000000000000112 <thread_create>:

void __dispatch(void);
void __schedule(void);

struct thread *thread_create(void (*f)(void *), void *arg, int processing_time, int period, int n)
{
     112:	715d                	addi	sp,sp,-80
     114:	e486                	sd	ra,72(sp)
     116:	e0a2                	sd	s0,64(sp)
     118:	0880                	addi	s0,sp,80
     11a:	fca43423          	sd	a0,-56(s0)
     11e:	fcb43023          	sd	a1,-64(s0)
     122:	87b2                	mv	a5,a2
     124:	faf42e23          	sw	a5,-68(s0)
     128:	87b6                	mv	a5,a3
     12a:	faf42c23          	sw	a5,-72(s0)
     12e:	87ba                	mv	a5,a4
     130:	faf42a23          	sw	a5,-76(s0)
    static int _id = 1;
    struct thread *t = (struct thread *)malloc(sizeof(struct thread));
     134:	05800513          	li	a0,88
     138:	00001097          	auipc	ra,0x1
     13c:	490080e7          	jalr	1168(ra) # 15c8 <malloc>
     140:	fea43423          	sd	a0,-24(s0)
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long)malloc(sizeof(unsigned long) * 0x200);
     144:	6505                	lui	a0,0x1
     146:	00001097          	auipc	ra,0x1
     14a:	482080e7          	jalr	1154(ra) # 15c8 <malloc>
     14e:	87aa                	mv	a5,a0
     150:	fef43023          	sd	a5,-32(s0)
    new_stack_p = new_stack + 0x200 * 8 - 0x2 * 8;
     154:	fe043703          	ld	a4,-32(s0)
     158:	6785                	lui	a5,0x1
     15a:	17c1                	addi	a5,a5,-16
     15c:	97ba                	add	a5,a5,a4
     15e:	fcf43c23          	sd	a5,-40(s0)
    t->fp = f;
     162:	fe843783          	ld	a5,-24(s0)
     166:	fc843703          	ld	a4,-56(s0)
     16a:	e398                	sd	a4,0(a5)
    t->arg = arg;
     16c:	fe843783          	ld	a5,-24(s0)
     170:	fc043703          	ld	a4,-64(s0)
     174:	e798                	sd	a4,8(a5)
    t->ID = _id++;
     176:	00002797          	auipc	a5,0x2
     17a:	dba78793          	addi	a5,a5,-582 # 1f30 <_id.0>
     17e:	439c                	lw	a5,0(a5)
     180:	0017871b          	addiw	a4,a5,1
     184:	0007069b          	sext.w	a3,a4
     188:	00002717          	auipc	a4,0x2
     18c:	da870713          	addi	a4,a4,-600 # 1f30 <_id.0>
     190:	c314                	sw	a3,0(a4)
     192:	fe843703          	ld	a4,-24(s0)
     196:	d31c                	sw	a5,32(a4)
    t->buf_set = 0;
     198:	fe843783          	ld	a5,-24(s0)
     19c:	0207ac23          	sw	zero,56(a5)
    t->stack = (void *)new_stack;
     1a0:	fe043703          	ld	a4,-32(s0)
     1a4:	fe843783          	ld	a5,-24(s0)
     1a8:	eb98                	sd	a4,16(a5)
    t->stack_p = (void *)new_stack_p;
     1aa:	fd843703          	ld	a4,-40(s0)
     1ae:	fe843783          	ld	a5,-24(s0)
     1b2:	ef98                	sd	a4,24(a5)

    t->processing_time = processing_time;
     1b4:	fe843783          	ld	a5,-24(s0)
     1b8:	fbc42703          	lw	a4,-68(s0)
     1bc:	c3b8                	sw	a4,64(a5)
    t->period = period;
     1be:	fe843783          	ld	a5,-24(s0)
     1c2:	fb842703          	lw	a4,-72(s0)
     1c6:	c3f8                	sw	a4,68(a5)
    t->n = n;
     1c8:	fe843783          	ld	a5,-24(s0)
     1cc:	fb442703          	lw	a4,-76(s0)
     1d0:	c7b8                	sw	a4,72(a5)
    t->remaining_time = 0;
     1d2:	fe843783          	ld	a5,-24(s0)
     1d6:	0407a623          	sw	zero,76(a5)
    t->current_deadline = 0;
     1da:	fe843783          	ld	a5,-24(s0)
     1de:	0407a823          	sw	zero,80(a5)
    return t;
     1e2:	fe843783          	ld	a5,-24(s0)
}
     1e6:	853e                	mv	a0,a5
     1e8:	60a6                	ld	ra,72(sp)
     1ea:	6406                	ld	s0,64(sp)
     1ec:	6161                	addi	sp,sp,80
     1ee:	8082                	ret

00000000000001f0 <thread_add_at>:

void thread_add_at(struct thread *t, int arrival_time)
{
     1f0:	7179                	addi	sp,sp,-48
     1f2:	f406                	sd	ra,40(sp)
     1f4:	f022                	sd	s0,32(sp)
     1f6:	1800                	addi	s0,sp,48
     1f8:	fca43c23          	sd	a0,-40(s0)
     1fc:	87ae                	mv	a5,a1
     1fe:	fcf42a23          	sw	a5,-44(s0)
    struct release_queue_entry *new_entry = (struct release_queue_entry *)malloc(sizeof(struct release_queue_entry));
     202:	02000513          	li	a0,32
     206:	00001097          	auipc	ra,0x1
     20a:	3c2080e7          	jalr	962(ra) # 15c8 <malloc>
     20e:	fea43423          	sd	a0,-24(s0)
    new_entry->thrd = t;
     212:	fe843783          	ld	a5,-24(s0)
     216:	fd843703          	ld	a4,-40(s0)
     21a:	e398                	sd	a4,0(a5)
    new_entry->release_time = arrival_time;
     21c:	fe843783          	ld	a5,-24(s0)
     220:	fd442703          	lw	a4,-44(s0)
     224:	cf98                	sw	a4,24(a5)
    t->current_deadline = arrival_time;
     226:	fd843783          	ld	a5,-40(s0)
     22a:	fd442703          	lw	a4,-44(s0)
     22e:	cbb8                	sw	a4,80(a5)
    list_add_tail(&new_entry->thread_list, &release_queue);
     230:	fe843783          	ld	a5,-24(s0)
     234:	07a1                	addi	a5,a5,8
     236:	00002597          	auipc	a1,0x2
     23a:	cd258593          	addi	a1,a1,-814 # 1f08 <release_queue>
     23e:	853e                	mv	a0,a5
     240:	00000097          	auipc	ra,0x0
     244:	e02080e7          	jalr	-510(ra) # 42 <list_add_tail>
}
     248:	0001                	nop
     24a:	70a2                	ld	ra,40(sp)
     24c:	7402                	ld	s0,32(sp)
     24e:	6145                	addi	sp,sp,48
     250:	8082                	ret

0000000000000252 <__release>:

void __release()
{
     252:	7139                	addi	sp,sp,-64
     254:	fc06                	sd	ra,56(sp)
     256:	f822                	sd	s0,48(sp)
     258:	0080                	addi	s0,sp,64
    struct release_queue_entry *cur, *nxt;
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
     25a:	00002797          	auipc	a5,0x2
     25e:	cae78793          	addi	a5,a5,-850 # 1f08 <release_queue>
     262:	639c                	ld	a5,0(a5)
     264:	fcf43c23          	sd	a5,-40(s0)
     268:	fd843783          	ld	a5,-40(s0)
     26c:	17e1                	addi	a5,a5,-8
     26e:	fef43423          	sd	a5,-24(s0)
     272:	fe843783          	ld	a5,-24(s0)
     276:	679c                	ld	a5,8(a5)
     278:	fcf43823          	sd	a5,-48(s0)
     27c:	fd043783          	ld	a5,-48(s0)
     280:	17e1                	addi	a5,a5,-8
     282:	fef43023          	sd	a5,-32(s0)
     286:	a851                	j	31a <__release+0xc8>
        if (threading_system_time >= cur->release_time) {
     288:	fe843783          	ld	a5,-24(s0)
     28c:	4f98                	lw	a4,24(a5)
     28e:	00002797          	auipc	a5,0x2
     292:	cb278793          	addi	a5,a5,-846 # 1f40 <threading_system_time>
     296:	439c                	lw	a5,0(a5)
     298:	06e7c363          	blt	a5,a4,2fe <__release+0xac>
            cur->thrd->remaining_time = cur->thrd->processing_time;
     29c:	fe843783          	ld	a5,-24(s0)
     2a0:	6398                	ld	a4,0(a5)
     2a2:	fe843783          	ld	a5,-24(s0)
     2a6:	639c                	ld	a5,0(a5)
     2a8:	4338                	lw	a4,64(a4)
     2aa:	c7f8                	sw	a4,76(a5)
            cur->thrd->current_deadline = cur->release_time + cur->thrd->period;
     2ac:	fe843783          	ld	a5,-24(s0)
     2b0:	4f94                	lw	a3,24(a5)
     2b2:	fe843783          	ld	a5,-24(s0)
     2b6:	639c                	ld	a5,0(a5)
     2b8:	43f8                	lw	a4,68(a5)
     2ba:	fe843783          	ld	a5,-24(s0)
     2be:	639c                	ld	a5,0(a5)
     2c0:	9f35                	addw	a4,a4,a3
     2c2:	2701                	sext.w	a4,a4
     2c4:	cbb8                	sw	a4,80(a5)
            list_add_tail(&cur->thrd->thread_list, &run_queue);
     2c6:	fe843783          	ld	a5,-24(s0)
     2ca:	639c                	ld	a5,0(a5)
     2cc:	02878793          	addi	a5,a5,40
     2d0:	00002597          	auipc	a1,0x2
     2d4:	c2858593          	addi	a1,a1,-984 # 1ef8 <run_queue>
     2d8:	853e                	mv	a0,a5
     2da:	00000097          	auipc	ra,0x0
     2de:	d68080e7          	jalr	-664(ra) # 42 <list_add_tail>
            list_del(&cur->thread_list);
     2e2:	fe843783          	ld	a5,-24(s0)
     2e6:	07a1                	addi	a5,a5,8
     2e8:	853e                	mv	a0,a5
     2ea:	00000097          	auipc	ra,0x0
     2ee:	db4080e7          	jalr	-588(ra) # 9e <list_del>
            free(cur);
     2f2:	fe843503          	ld	a0,-24(s0)
     2f6:	00001097          	auipc	ra,0x1
     2fa:	130080e7          	jalr	304(ra) # 1426 <free>
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
     2fe:	fe043783          	ld	a5,-32(s0)
     302:	fef43423          	sd	a5,-24(s0)
     306:	fe043783          	ld	a5,-32(s0)
     30a:	679c                	ld	a5,8(a5)
     30c:	fcf43423          	sd	a5,-56(s0)
     310:	fc843783          	ld	a5,-56(s0)
     314:	17e1                	addi	a5,a5,-8
     316:	fef43023          	sd	a5,-32(s0)
     31a:	fe843783          	ld	a5,-24(s0)
     31e:	00878713          	addi	a4,a5,8
     322:	00002797          	auipc	a5,0x2
     326:	be678793          	addi	a5,a5,-1050 # 1f08 <release_queue>
     32a:	f4f71fe3          	bne	a4,a5,288 <__release+0x36>
        }
    }
}
     32e:	0001                	nop
     330:	0001                	nop
     332:	70e2                	ld	ra,56(sp)
     334:	7442                	ld	s0,48(sp)
     336:	6121                	addi	sp,sp,64
     338:	8082                	ret

000000000000033a <__thread_exit>:

void __thread_exit(struct thread *to_remove)
{
     33a:	1101                	addi	sp,sp,-32
     33c:	ec06                	sd	ra,24(sp)
     33e:	e822                	sd	s0,16(sp)
     340:	1000                	addi	s0,sp,32
     342:	fea43423          	sd	a0,-24(s0)
    current = to_remove->thread_list.prev;
     346:	fe843783          	ld	a5,-24(s0)
     34a:	7b98                	ld	a4,48(a5)
     34c:	00002797          	auipc	a5,0x2
     350:	bec78793          	addi	a5,a5,-1044 # 1f38 <current>
     354:	e398                	sd	a4,0(a5)
    list_del(&to_remove->thread_list);
     356:	fe843783          	ld	a5,-24(s0)
     35a:	02878793          	addi	a5,a5,40
     35e:	853e                	mv	a0,a5
     360:	00000097          	auipc	ra,0x0
     364:	d3e080e7          	jalr	-706(ra) # 9e <list_del>

    free(to_remove->stack);
     368:	fe843783          	ld	a5,-24(s0)
     36c:	6b9c                	ld	a5,16(a5)
     36e:	853e                	mv	a0,a5
     370:	00001097          	auipc	ra,0x1
     374:	0b6080e7          	jalr	182(ra) # 1426 <free>
    free(to_remove);
     378:	fe843503          	ld	a0,-24(s0)
     37c:	00001097          	auipc	ra,0x1
     380:	0aa080e7          	jalr	170(ra) # 1426 <free>

    __schedule();
     384:	00000097          	auipc	ra,0x0
     388:	446080e7          	jalr	1094(ra) # 7ca <__schedule>
    __dispatch();
     38c:	00000097          	auipc	ra,0x0
     390:	2b6080e7          	jalr	694(ra) # 642 <__dispatch>
    thrdresume(main_thrd_id);
     394:	00002797          	auipc	a5,0x2
     398:	b9878793          	addi	a5,a5,-1128 # 1f2c <main_thrd_id>
     39c:	439c                	lw	a5,0(a5)
     39e:	853e                	mv	a0,a5
     3a0:	00001097          	auipc	ra,0x1
     3a4:	b98080e7          	jalr	-1128(ra) # f38 <thrdresume>
}
     3a8:	0001                	nop
     3aa:	60e2                	ld	ra,24(sp)
     3ac:	6442                	ld	s0,16(sp)
     3ae:	6105                	addi	sp,sp,32
     3b0:	8082                	ret

00000000000003b2 <thread_exit>:

void thread_exit(void)
{
     3b2:	7179                	addi	sp,sp,-48
     3b4:	f406                	sd	ra,40(sp)
     3b6:	f022                	sd	s0,32(sp)
     3b8:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
     3ba:	00002797          	auipc	a5,0x2
     3be:	b7e78793          	addi	a5,a5,-1154 # 1f38 <current>
     3c2:	6398                	ld	a4,0(a5)
     3c4:	00002797          	auipc	a5,0x2
     3c8:	b3478793          	addi	a5,a5,-1228 # 1ef8 <run_queue>
     3cc:	02f71063          	bne	a4,a5,3ec <thread_exit+0x3a>
        fprintf(2, "[FATAL] thread_exit is called on a nonexistent thread\n");
     3d0:	00002597          	auipc	a1,0x2
     3d4:	9f858593          	addi	a1,a1,-1544 # 1dc8 <schedule_rm+0x2b8>
     3d8:	4509                	li	a0,2
     3da:	00001097          	auipc	ra,0x1
     3de:	fa4080e7          	jalr	-92(ra) # 137e <fprintf>
        exit(1);
     3e2:	4505                	li	a0,1
     3e4:	00001097          	auipc	ra,0x1
     3e8:	aac080e7          	jalr	-1364(ra) # e90 <exit>
    }

    struct thread *to_remove = list_entry(current, struct thread, thread_list);
     3ec:	00002797          	auipc	a5,0x2
     3f0:	b4c78793          	addi	a5,a5,-1204 # 1f38 <current>
     3f4:	639c                	ld	a5,0(a5)
     3f6:	fef43423          	sd	a5,-24(s0)
     3fa:	fe843783          	ld	a5,-24(s0)
     3fe:	fd878793          	addi	a5,a5,-40
     402:	fef43023          	sd	a5,-32(s0)
    int consume_ticks = cancelthrdstop(to_remove->thrdstop_context_id, 1);
     406:	fe043783          	ld	a5,-32(s0)
     40a:	5fdc                	lw	a5,60(a5)
     40c:	4585                	li	a1,1
     40e:	853e                	mv	a0,a5
     410:	00001097          	auipc	ra,0x1
     414:	b30080e7          	jalr	-1232(ra) # f40 <cancelthrdstop>
     418:	87aa                	mv	a5,a0
     41a:	fcf42e23          	sw	a5,-36(s0)
    threading_system_time += consume_ticks;
     41e:	00002797          	auipc	a5,0x2
     422:	b2278793          	addi	a5,a5,-1246 # 1f40 <threading_system_time>
     426:	439c                	lw	a5,0(a5)
     428:	fdc42703          	lw	a4,-36(s0)
     42c:	9fb9                	addw	a5,a5,a4
     42e:	0007871b          	sext.w	a4,a5
     432:	00002797          	auipc	a5,0x2
     436:	b0e78793          	addi	a5,a5,-1266 # 1f40 <threading_system_time>
     43a:	c398                	sw	a4,0(a5)

    __release();
     43c:	00000097          	auipc	ra,0x0
     440:	e16080e7          	jalr	-490(ra) # 252 <__release>
    __thread_exit(to_remove);
     444:	fe043503          	ld	a0,-32(s0)
     448:	00000097          	auipc	ra,0x0
     44c:	ef2080e7          	jalr	-270(ra) # 33a <__thread_exit>
}
     450:	0001                	nop
     452:	70a2                	ld	ra,40(sp)
     454:	7402                	ld	s0,32(sp)
     456:	6145                	addi	sp,sp,48
     458:	8082                	ret

000000000000045a <__finish_current>:

void __finish_current()
{
     45a:	7179                	addi	sp,sp,-48
     45c:	f406                	sd	ra,40(sp)
     45e:	f022                	sd	s0,32(sp)
     460:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
     462:	00002797          	auipc	a5,0x2
     466:	ad678793          	addi	a5,a5,-1322 # 1f38 <current>
     46a:	639c                	ld	a5,0(a5)
     46c:	fef43423          	sd	a5,-24(s0)
     470:	fe843783          	ld	a5,-24(s0)
     474:	fd878793          	addi	a5,a5,-40
     478:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
     47c:	fe043783          	ld	a5,-32(s0)
     480:	47bc                	lw	a5,72(a5)
     482:	37fd                	addiw	a5,a5,-1
     484:	0007871b          	sext.w	a4,a5
     488:	fe043783          	ld	a5,-32(s0)
     48c:	c7b8                	sw	a4,72(a5)

    printf("thread#%d finish one cycle at %d: %d cycles left\n",
     48e:	fe043783          	ld	a5,-32(s0)
     492:	5398                	lw	a4,32(a5)
     494:	00002797          	auipc	a5,0x2
     498:	aac78793          	addi	a5,a5,-1364 # 1f40 <threading_system_time>
     49c:	4390                	lw	a2,0(a5)
     49e:	fe043783          	ld	a5,-32(s0)
     4a2:	47bc                	lw	a5,72(a5)
     4a4:	86be                	mv	a3,a5
     4a6:	85ba                	mv	a1,a4
     4a8:	00002517          	auipc	a0,0x2
     4ac:	95850513          	addi	a0,a0,-1704 # 1e00 <schedule_rm+0x2f0>
     4b0:	00001097          	auipc	ra,0x1
     4b4:	f26080e7          	jalr	-218(ra) # 13d6 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
     4b8:	fe043783          	ld	a5,-32(s0)
     4bc:	47bc                	lw	a5,72(a5)
     4be:	04f05563          	blez	a5,508 <__finish_current+0xae>
        struct list_head *to_remove = current;
     4c2:	00002797          	auipc	a5,0x2
     4c6:	a7678793          	addi	a5,a5,-1418 # 1f38 <current>
     4ca:	639c                	ld	a5,0(a5)
     4cc:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
     4d0:	00002797          	auipc	a5,0x2
     4d4:	a6878793          	addi	a5,a5,-1432 # 1f38 <current>
     4d8:	639c                	ld	a5,0(a5)
     4da:	6798                	ld	a4,8(a5)
     4dc:	00002797          	auipc	a5,0x2
     4e0:	a5c78793          	addi	a5,a5,-1444 # 1f38 <current>
     4e4:	e398                	sd	a4,0(a5)
        list_del(to_remove);
     4e6:	fd843503          	ld	a0,-40(s0)
     4ea:	00000097          	auipc	ra,0x0
     4ee:	bb4080e7          	jalr	-1100(ra) # 9e <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
     4f2:	fe043783          	ld	a5,-32(s0)
     4f6:	4bbc                	lw	a5,80(a5)
     4f8:	85be                	mv	a1,a5
     4fa:	fe043503          	ld	a0,-32(s0)
     4fe:	00000097          	auipc	ra,0x0
     502:	cf2080e7          	jalr	-782(ra) # 1f0 <thread_add_at>
    } else {
        __thread_exit(current_thread);
    }
}
     506:	a039                	j	514 <__finish_current+0xba>
        __thread_exit(current_thread);
     508:	fe043503          	ld	a0,-32(s0)
     50c:	00000097          	auipc	ra,0x0
     510:	e2e080e7          	jalr	-466(ra) # 33a <__thread_exit>
}
     514:	0001                	nop
     516:	70a2                	ld	ra,40(sp)
     518:	7402                	ld	s0,32(sp)
     51a:	6145                	addi	sp,sp,48
     51c:	8082                	ret

000000000000051e <switch_handler>:

void switch_handler(void *arg)
{
     51e:	7139                	addi	sp,sp,-64
     520:	fc06                	sd	ra,56(sp)
     522:	f822                	sd	s0,48(sp)
     524:	0080                	addi	s0,sp,64
     526:	fca43423          	sd	a0,-56(s0)
    uint64 elapsed_time = (uint64)arg;
     52a:	fc843783          	ld	a5,-56(s0)
     52e:	fef43423          	sd	a5,-24(s0)
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
     532:	00002797          	auipc	a5,0x2
     536:	a0678793          	addi	a5,a5,-1530 # 1f38 <current>
     53a:	639c                	ld	a5,0(a5)
     53c:	fef43023          	sd	a5,-32(s0)
     540:	fe043783          	ld	a5,-32(s0)
     544:	fd878793          	addi	a5,a5,-40
     548:	fcf43c23          	sd	a5,-40(s0)

    threading_system_time += elapsed_time;
     54c:	fe843783          	ld	a5,-24(s0)
     550:	0007871b          	sext.w	a4,a5
     554:	00002797          	auipc	a5,0x2
     558:	9ec78793          	addi	a5,a5,-1556 # 1f40 <threading_system_time>
     55c:	439c                	lw	a5,0(a5)
     55e:	2781                	sext.w	a5,a5
     560:	9fb9                	addw	a5,a5,a4
     562:	2781                	sext.w	a5,a5
     564:	0007871b          	sext.w	a4,a5
     568:	00002797          	auipc	a5,0x2
     56c:	9d878793          	addi	a5,a5,-1576 # 1f40 <threading_system_time>
     570:	c398                	sw	a4,0(a5)
     __release();
     572:	00000097          	auipc	ra,0x0
     576:	ce0080e7          	jalr	-800(ra) # 252 <__release>
    current_thread->remaining_time -= elapsed_time;
     57a:	fd843783          	ld	a5,-40(s0)
     57e:	47fc                	lw	a5,76(a5)
     580:	0007871b          	sext.w	a4,a5
     584:	fe843783          	ld	a5,-24(s0)
     588:	2781                	sext.w	a5,a5
     58a:	40f707bb          	subw	a5,a4,a5
     58e:	2781                	sext.w	a5,a5
     590:	0007871b          	sext.w	a4,a5
     594:	fd843783          	ld	a5,-40(s0)
     598:	c7f8                	sw	a4,76(a5)

    if (threading_system_time > current_thread->current_deadline || 
     59a:	fd843783          	ld	a5,-40(s0)
     59e:	4bb8                	lw	a4,80(a5)
     5a0:	00002797          	auipc	a5,0x2
     5a4:	9a078793          	addi	a5,a5,-1632 # 1f40 <threading_system_time>
     5a8:	439c                	lw	a5,0(a5)
     5aa:	02f74163          	blt	a4,a5,5cc <switch_handler+0xae>
        (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
     5ae:	fd843783          	ld	a5,-40(s0)
     5b2:	4bb8                	lw	a4,80(a5)
     5b4:	00002797          	auipc	a5,0x2
     5b8:	98c78793          	addi	a5,a5,-1652 # 1f40 <threading_system_time>
     5bc:	439c                	lw	a5,0(a5)
    if (threading_system_time > current_thread->current_deadline || 
     5be:	02f71e63          	bne	a4,a5,5fa <switch_handler+0xdc>
        (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
     5c2:	fd843783          	ld	a5,-40(s0)
     5c6:	47fc                	lw	a5,76(a5)
     5c8:	02f05963          	blez	a5,5fa <switch_handler+0xdc>
        printf("thread#%d misses a deadline at %d\n", current_thread->ID, threading_system_time);
     5cc:	fd843783          	ld	a5,-40(s0)
     5d0:	5398                	lw	a4,32(a5)
     5d2:	00002797          	auipc	a5,0x2
     5d6:	96e78793          	addi	a5,a5,-1682 # 1f40 <threading_system_time>
     5da:	439c                	lw	a5,0(a5)
     5dc:	863e                	mv	a2,a5
     5de:	85ba                	mv	a1,a4
     5e0:	00002517          	auipc	a0,0x2
     5e4:	85850513          	addi	a0,a0,-1960 # 1e38 <schedule_rm+0x328>
     5e8:	00001097          	auipc	ra,0x1
     5ec:	dee080e7          	jalr	-530(ra) # 13d6 <printf>
        exit(0);
     5f0:	4501                	li	a0,0
     5f2:	00001097          	auipc	ra,0x1
     5f6:	89e080e7          	jalr	-1890(ra) # e90 <exit>
    }

    if (current_thread->remaining_time <= 0) {
     5fa:	fd843783          	ld	a5,-40(s0)
     5fe:	47fc                	lw	a5,76(a5)
     600:	00f04663          	bgtz	a5,60c <switch_handler+0xee>
        __finish_current();
     604:	00000097          	auipc	ra,0x0
     608:	e56080e7          	jalr	-426(ra) # 45a <__finish_current>
    }

    __release();
     60c:	00000097          	auipc	ra,0x0
     610:	c46080e7          	jalr	-954(ra) # 252 <__release>
    __schedule();
     614:	00000097          	auipc	ra,0x0
     618:	1b6080e7          	jalr	438(ra) # 7ca <__schedule>
    __dispatch();
     61c:	00000097          	auipc	ra,0x0
     620:	026080e7          	jalr	38(ra) # 642 <__dispatch>
    thrdresume(main_thrd_id);
     624:	00002797          	auipc	a5,0x2
     628:	90878793          	addi	a5,a5,-1784 # 1f2c <main_thrd_id>
     62c:	439c                	lw	a5,0(a5)
     62e:	853e                	mv	a0,a5
     630:	00001097          	auipc	ra,0x1
     634:	908080e7          	jalr	-1784(ra) # f38 <thrdresume>
}
     638:	0001                	nop
     63a:	70e2                	ld	ra,56(sp)
     63c:	7442                	ld	s0,48(sp)
     63e:	6121                	addi	sp,sp,64
     640:	8082                	ret

0000000000000642 <__dispatch>:

void __dispatch()
{
     642:	7179                	addi	sp,sp,-48
     644:	f406                	sd	ra,40(sp)
     646:	f022                	sd	s0,32(sp)
     648:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
     64a:	00002797          	auipc	a5,0x2
     64e:	8ee78793          	addi	a5,a5,-1810 # 1f38 <current>
     652:	6398                	ld	a4,0(a5)
     654:	00002797          	auipc	a5,0x2
     658:	8a478793          	addi	a5,a5,-1884 # 1ef8 <run_queue>
     65c:	16f70263          	beq	a4,a5,7c0 <__dispatch+0x17e>
    if (allocated_time < 0) {
        fprintf(2, "[FATAL] allocated_time is negative\n");
        exit(1);
    }

    struct thread *current_thread = list_entry(current, struct thread, thread_list);
     660:	00002797          	auipc	a5,0x2
     664:	8d878793          	addi	a5,a5,-1832 # 1f38 <current>
     668:	639c                	ld	a5,0(a5)
     66a:	fef43423          	sd	a5,-24(s0)
     66e:	fe843783          	ld	a5,-24(s0)
     672:	fd878793          	addi	a5,a5,-40
     676:	fef43023          	sd	a5,-32(s0)
     if (allocated_time == 0) { // miss deadline, abort
     67a:	00002797          	auipc	a5,0x2
     67e:	8ce78793          	addi	a5,a5,-1842 # 1f48 <allocated_time>
     682:	639c                	ld	a5,0(a5)
     684:	e795                	bnez	a5,6b0 <__dispatch+0x6e>
        printf("thread#%d misses a deadline at %d\n", current_thread->ID, current_thread->current_deadline);
     686:	fe043783          	ld	a5,-32(s0)
     68a:	5398                	lw	a4,32(a5)
     68c:	fe043783          	ld	a5,-32(s0)
     690:	4bbc                	lw	a5,80(a5)
     692:	863e                	mv	a2,a5
     694:	85ba                	mv	a1,a4
     696:	00001517          	auipc	a0,0x1
     69a:	7a250513          	addi	a0,a0,1954 # 1e38 <schedule_rm+0x328>
     69e:	00001097          	auipc	ra,0x1
     6a2:	d38080e7          	jalr	-712(ra) # 13d6 <printf>
        exit(0);
     6a6:	4501                	li	a0,0
     6a8:	00000097          	auipc	ra,0x0
     6ac:	7e8080e7          	jalr	2024(ra) # e90 <exit>
    }

    printf("dispatch thread#%d at %d: allocated_time=%d\n", current_thread->ID, threading_system_time, allocated_time);
     6b0:	fe043783          	ld	a5,-32(s0)
     6b4:	5398                	lw	a4,32(a5)
     6b6:	00002797          	auipc	a5,0x2
     6ba:	88a78793          	addi	a5,a5,-1910 # 1f40 <threading_system_time>
     6be:	4390                	lw	a2,0(a5)
     6c0:	00002797          	auipc	a5,0x2
     6c4:	88878793          	addi	a5,a5,-1912 # 1f48 <allocated_time>
     6c8:	639c                	ld	a5,0(a5)
     6ca:	86be                	mv	a3,a5
     6cc:	85ba                	mv	a1,a4
     6ce:	00001517          	auipc	a0,0x1
     6d2:	79250513          	addi	a0,a0,1938 # 1e60 <schedule_rm+0x350>
     6d6:	00001097          	auipc	ra,0x1
     6da:	d00080e7          	jalr	-768(ra) # 13d6 <printf>

    if (current_thread->buf_set) {
     6de:	fe043783          	ld	a5,-32(s0)
     6e2:	5f9c                	lw	a5,56(a5)
     6e4:	c7a1                	beqz	a5,72c <__dispatch+0xea>
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
     6e6:	00002797          	auipc	a5,0x2
     6ea:	86278793          	addi	a5,a5,-1950 # 1f48 <allocated_time>
     6ee:	639c                	ld	a5,0(a5)
     6f0:	0007871b          	sext.w	a4,a5
     6f4:	fe043783          	ld	a5,-32(s0)
     6f8:	03c78593          	addi	a1,a5,60
     6fc:	00002797          	auipc	a5,0x2
     700:	84c78793          	addi	a5,a5,-1972 # 1f48 <allocated_time>
     704:	639c                	ld	a5,0(a5)
     706:	86be                	mv	a3,a5
     708:	00000617          	auipc	a2,0x0
     70c:	e1660613          	addi	a2,a2,-490 # 51e <switch_handler>
     710:	853a                	mv	a0,a4
     712:	00001097          	auipc	ra,0x1
     716:	81e080e7          	jalr	-2018(ra) # f30 <thrdstop>
        thrdresume(current_thread->thrdstop_context_id);
     71a:	fe043783          	ld	a5,-32(s0)
     71e:	5fdc                	lw	a5,60(a5)
     720:	853e                	mv	a0,a5
     722:	00001097          	auipc	ra,0x1
     726:	816080e7          	jalr	-2026(ra) # f38 <thrdresume>
     72a:	a071                	j	7b6 <__dispatch+0x174>
    } else {
        current_thread->buf_set = 1;
     72c:	fe043783          	ld	a5,-32(s0)
     730:	4705                	li	a4,1
     732:	df98                	sw	a4,56(a5)
        unsigned long new_stack_p = (unsigned long)current_thread->stack_p;
     734:	fe043783          	ld	a5,-32(s0)
     738:	6f9c                	ld	a5,24(a5)
     73a:	fcf43c23          	sd	a5,-40(s0)
        current_thread->thrdstop_context_id = -1;
     73e:	fe043783          	ld	a5,-32(s0)
     742:	577d                	li	a4,-1
     744:	dfd8                	sw	a4,60(a5)
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
     746:	00002797          	auipc	a5,0x2
     74a:	80278793          	addi	a5,a5,-2046 # 1f48 <allocated_time>
     74e:	639c                	ld	a5,0(a5)
     750:	0007871b          	sext.w	a4,a5
     754:	fe043783          	ld	a5,-32(s0)
     758:	03c78593          	addi	a1,a5,60
     75c:	00001797          	auipc	a5,0x1
     760:	7ec78793          	addi	a5,a5,2028 # 1f48 <allocated_time>
     764:	639c                	ld	a5,0(a5)
     766:	86be                	mv	a3,a5
     768:	00000617          	auipc	a2,0x0
     76c:	db660613          	addi	a2,a2,-586 # 51e <switch_handler>
     770:	853a                	mv	a0,a4
     772:	00000097          	auipc	ra,0x0
     776:	7be080e7          	jalr	1982(ra) # f30 <thrdstop>
        if (current_thread->thrdstop_context_id < 0) {
     77a:	fe043783          	ld	a5,-32(s0)
     77e:	5fdc                	lw	a5,60(a5)
     780:	0207d063          	bgez	a5,7a0 <__dispatch+0x15e>
            fprintf(2, "[ERROR] number of threads may exceed MAX_THRD_NUM\n");
     784:	00001597          	auipc	a1,0x1
     788:	70c58593          	addi	a1,a1,1804 # 1e90 <schedule_rm+0x380>
     78c:	4509                	li	a0,2
     78e:	00001097          	auipc	ra,0x1
     792:	bf0080e7          	jalr	-1040(ra) # 137e <fprintf>
            exit(1);
     796:	4505                	li	a0,1
     798:	00000097          	auipc	ra,0x0
     79c:	6f8080e7          	jalr	1784(ra) # e90 <exit>
        }

        // set sp to stack pointer of current thread.
        asm volatile("mv sp, %0"
     7a0:	fd843783          	ld	a5,-40(s0)
     7a4:	813e                	mv	sp,a5
                     :
                     : "r"(new_stack_p));
        current_thread->fp(current_thread->arg);
     7a6:	fe043783          	ld	a5,-32(s0)
     7aa:	6398                	ld	a4,0(a5)
     7ac:	fe043783          	ld	a5,-32(s0)
     7b0:	679c                	ld	a5,8(a5)
     7b2:	853e                	mv	a0,a5
     7b4:	9702                	jalr	a4
    }
    thread_exit();
     7b6:	00000097          	auipc	ra,0x0
     7ba:	bfc080e7          	jalr	-1028(ra) # 3b2 <thread_exit>
     7be:	a011                	j	7c2 <__dispatch+0x180>
        return;
     7c0:	0001                	nop
}
     7c2:	70a2                	ld	ra,40(sp)
     7c4:	7402                	ld	s0,32(sp)
     7c6:	6145                	addi	sp,sp,48
     7c8:	8082                	ret

00000000000007ca <__schedule>:

void __schedule(void)
{
     7ca:	711d                	addi	sp,sp,-96
     7cc:	ec86                	sd	ra,88(sp)
     7ce:	e8a2                	sd	s0,80(sp)
     7d0:	1080                	addi	s0,sp,96
    struct threads_sched_args args = {
     7d2:	00001797          	auipc	a5,0x1
     7d6:	76e78793          	addi	a5,a5,1902 # 1f40 <threading_system_time>
     7da:	439c                	lw	a5,0(a5)
     7dc:	fcf42c23          	sw	a5,-40(s0)
     7e0:	00001797          	auipc	a5,0x1
     7e4:	71878793          	addi	a5,a5,1816 # 1ef8 <run_queue>
     7e8:	fef43023          	sd	a5,-32(s0)
     7ec:	00001797          	auipc	a5,0x1
     7f0:	71c78793          	addi	a5,a5,1820 # 1f08 <release_queue>
     7f4:	fef43423          	sd	a5,-24(s0)
#ifdef THREAD_SCHEDULER_EDF
    r = schedule_edf(args);
#endif

#ifdef THREAD_SCHEDULER_RM
    r = schedule_rm(args);
     7f8:	fd843783          	ld	a5,-40(s0)
     7fc:	faf43023          	sd	a5,-96(s0)
     800:	fe043783          	ld	a5,-32(s0)
     804:	faf43423          	sd	a5,-88(s0)
     808:	fe843783          	ld	a5,-24(s0)
     80c:	faf43823          	sd	a5,-80(s0)
     810:	fa040793          	addi	a5,s0,-96
     814:	853e                	mv	a0,a5
     816:	00001097          	auipc	ra,0x1
     81a:	2fa080e7          	jalr	762(ra) # 1b10 <schedule_rm>
     81e:	872a                	mv	a4,a0
     820:	87ae                	mv	a5,a1
     822:	fce43423          	sd	a4,-56(s0)
     826:	fcf43823          	sd	a5,-48(s0)
#endif

    current = r.scheduled_thread_list_member;
     82a:	fc843703          	ld	a4,-56(s0)
     82e:	00001797          	auipc	a5,0x1
     832:	70a78793          	addi	a5,a5,1802 # 1f38 <current>
     836:	e398                	sd	a4,0(a5)
    allocated_time = r.allocated_time;
     838:	fd042783          	lw	a5,-48(s0)
     83c:	873e                	mv	a4,a5
     83e:	00001797          	auipc	a5,0x1
     842:	70a78793          	addi	a5,a5,1802 # 1f48 <allocated_time>
     846:	e398                	sd	a4,0(a5)
}
     848:	0001                	nop
     84a:	60e6                	ld	ra,88(sp)
     84c:	6446                	ld	s0,80(sp)
     84e:	6125                	addi	sp,sp,96
     850:	8082                	ret

0000000000000852 <back_to_main_handler>:

void back_to_main_handler(void *arg)
{
     852:	1101                	addi	sp,sp,-32
     854:	ec06                	sd	ra,24(sp)
     856:	e822                	sd	s0,16(sp)
     858:	1000                	addi	s0,sp,32
     85a:	fea43423          	sd	a0,-24(s0)
    sleeping = 0;
     85e:	00001797          	auipc	a5,0x1
     862:	6e678793          	addi	a5,a5,1766 # 1f44 <sleeping>
     866:	0007a023          	sw	zero,0(a5)
    threading_system_time += (uint64)arg;
     86a:	fe843783          	ld	a5,-24(s0)
     86e:	0007871b          	sext.w	a4,a5
     872:	00001797          	auipc	a5,0x1
     876:	6ce78793          	addi	a5,a5,1742 # 1f40 <threading_system_time>
     87a:	439c                	lw	a5,0(a5)
     87c:	2781                	sext.w	a5,a5
     87e:	9fb9                	addw	a5,a5,a4
     880:	2781                	sext.w	a5,a5
     882:	0007871b          	sext.w	a4,a5
     886:	00001797          	auipc	a5,0x1
     88a:	6ba78793          	addi	a5,a5,1722 # 1f40 <threading_system_time>
     88e:	c398                	sw	a4,0(a5)
    thrdresume(main_thrd_id);
     890:	00001797          	auipc	a5,0x1
     894:	69c78793          	addi	a5,a5,1692 # 1f2c <main_thrd_id>
     898:	439c                	lw	a5,0(a5)
     89a:	853e                	mv	a0,a5
     89c:	00000097          	auipc	ra,0x0
     8a0:	69c080e7          	jalr	1692(ra) # f38 <thrdresume>
}
     8a4:	0001                	nop
     8a6:	60e2                	ld	ra,24(sp)
     8a8:	6442                	ld	s0,16(sp)
     8aa:	6105                	addi	sp,sp,32
     8ac:	8082                	ret

00000000000008ae <thread_start_threading>:

void thread_start_threading()
{
     8ae:	1141                	addi	sp,sp,-16
     8b0:	e406                	sd	ra,8(sp)
     8b2:	e022                	sd	s0,0(sp)
     8b4:	0800                	addi	s0,sp,16
    threading_system_time = 0;
     8b6:	00001797          	auipc	a5,0x1
     8ba:	68a78793          	addi	a5,a5,1674 # 1f40 <threading_system_time>
     8be:	0007a023          	sw	zero,0(a5)
    current = &run_queue;
     8c2:	00001797          	auipc	a5,0x1
     8c6:	67678793          	addi	a5,a5,1654 # 1f38 <current>
     8ca:	00001717          	auipc	a4,0x1
     8ce:	62e70713          	addi	a4,a4,1582 # 1ef8 <run_queue>
     8d2:	e398                	sd	a4,0(a5)

    // call thrdstop just for obtain an ID
    thrdstop(1000, &main_thrd_id, back_to_main_handler, (void *)0);
     8d4:	4681                	li	a3,0
     8d6:	00000617          	auipc	a2,0x0
     8da:	f7c60613          	addi	a2,a2,-132 # 852 <back_to_main_handler>
     8de:	00001597          	auipc	a1,0x1
     8e2:	64e58593          	addi	a1,a1,1614 # 1f2c <main_thrd_id>
     8e6:	3e800513          	li	a0,1000
     8ea:	00000097          	auipc	ra,0x0
     8ee:	646080e7          	jalr	1606(ra) # f30 <thrdstop>
    cancelthrdstop(main_thrd_id, 0);
     8f2:	00001797          	auipc	a5,0x1
     8f6:	63a78793          	addi	a5,a5,1594 # 1f2c <main_thrd_id>
     8fa:	439c                	lw	a5,0(a5)
     8fc:	4581                	li	a1,0
     8fe:	853e                	mv	a0,a5
     900:	00000097          	auipc	ra,0x0
     904:	640080e7          	jalr	1600(ra) # f40 <cancelthrdstop>

    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
     908:	a0c9                	j	9ca <thread_start_threading+0x11c>
        __release();
     90a:	00000097          	auipc	ra,0x0
     90e:	948080e7          	jalr	-1720(ra) # 252 <__release>
        __schedule();
     912:	00000097          	auipc	ra,0x0
     916:	eb8080e7          	jalr	-328(ra) # 7ca <__schedule>
        cancelthrdstop(main_thrd_id, 0);
     91a:	00001797          	auipc	a5,0x1
     91e:	61278793          	addi	a5,a5,1554 # 1f2c <main_thrd_id>
     922:	439c                	lw	a5,0(a5)
     924:	4581                	li	a1,0
     926:	853e                	mv	a0,a5
     928:	00000097          	auipc	ra,0x0
     92c:	618080e7          	jalr	1560(ra) # f40 <cancelthrdstop>
        __dispatch();
     930:	00000097          	auipc	ra,0x0
     934:	d12080e7          	jalr	-750(ra) # 642 <__dispatch>

        if (list_empty(&run_queue) && list_empty(&release_queue)) {
     938:	00001517          	auipc	a0,0x1
     93c:	5c050513          	addi	a0,a0,1472 # 1ef8 <run_queue>
     940:	fffff097          	auipc	ra,0xfffff
     944:	7a8080e7          	jalr	1960(ra) # e8 <list_empty>
     948:	87aa                	mv	a5,a0
     94a:	cb99                	beqz	a5,960 <thread_start_threading+0xb2>
     94c:	00001517          	auipc	a0,0x1
     950:	5bc50513          	addi	a0,a0,1468 # 1f08 <release_queue>
     954:	fffff097          	auipc	ra,0xfffff
     958:	794080e7          	jalr	1940(ra) # e8 <list_empty>
     95c:	87aa                	mv	a5,a0
     95e:	ebd9                	bnez	a5,9f4 <thread_start_threading+0x146>
            break;
        }

        // no thread in run_queue, release_queue not empty
        printf("run_queue is empty, sleep for %d ticks\n", allocated_time);
     960:	00001797          	auipc	a5,0x1
     964:	5e878793          	addi	a5,a5,1512 # 1f48 <allocated_time>
     968:	639c                	ld	a5,0(a5)
     96a:	85be                	mv	a1,a5
     96c:	00001517          	auipc	a0,0x1
     970:	55c50513          	addi	a0,a0,1372 # 1ec8 <schedule_rm+0x3b8>
     974:	00001097          	auipc	ra,0x1
     978:	a62080e7          	jalr	-1438(ra) # 13d6 <printf>
        sleeping = 1;
     97c:	00001797          	auipc	a5,0x1
     980:	5c878793          	addi	a5,a5,1480 # 1f44 <sleeping>
     984:	4705                	li	a4,1
     986:	c398                	sw	a4,0(a5)
        thrdstop(allocated_time, &main_thrd_id, back_to_main_handler, (void *)allocated_time);
     988:	00001797          	auipc	a5,0x1
     98c:	5c078793          	addi	a5,a5,1472 # 1f48 <allocated_time>
     990:	639c                	ld	a5,0(a5)
     992:	0007871b          	sext.w	a4,a5
     996:	00001797          	auipc	a5,0x1
     99a:	5b278793          	addi	a5,a5,1458 # 1f48 <allocated_time>
     99e:	639c                	ld	a5,0(a5)
     9a0:	86be                	mv	a3,a5
     9a2:	00000617          	auipc	a2,0x0
     9a6:	eb060613          	addi	a2,a2,-336 # 852 <back_to_main_handler>
     9aa:	00001597          	auipc	a1,0x1
     9ae:	58258593          	addi	a1,a1,1410 # 1f2c <main_thrd_id>
     9b2:	853a                	mv	a0,a4
     9b4:	00000097          	auipc	ra,0x0
     9b8:	57c080e7          	jalr	1404(ra) # f30 <thrdstop>
        while (sleeping) {
     9bc:	0001                	nop
     9be:	00001797          	auipc	a5,0x1
     9c2:	58678793          	addi	a5,a5,1414 # 1f44 <sleeping>
     9c6:	439c                	lw	a5,0(a5)
     9c8:	fbfd                	bnez	a5,9be <thread_start_threading+0x110>
    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
     9ca:	00001517          	auipc	a0,0x1
     9ce:	52e50513          	addi	a0,a0,1326 # 1ef8 <run_queue>
     9d2:	fffff097          	auipc	ra,0xfffff
     9d6:	716080e7          	jalr	1814(ra) # e8 <list_empty>
     9da:	87aa                	mv	a5,a0
     9dc:	d79d                	beqz	a5,90a <thread_start_threading+0x5c>
     9de:	00001517          	auipc	a0,0x1
     9e2:	52a50513          	addi	a0,a0,1322 # 1f08 <release_queue>
     9e6:	fffff097          	auipc	ra,0xfffff
     9ea:	702080e7          	jalr	1794(ra) # e8 <list_empty>
     9ee:	87aa                	mv	a5,a0
     9f0:	df89                	beqz	a5,90a <thread_start_threading+0x5c>
            // zzz...
        }
    }
}
     9f2:	a011                	j	9f6 <thread_start_threading+0x148>
            break;
     9f4:	0001                	nop
}
     9f6:	0001                	nop
     9f8:	60a2                	ld	ra,8(sp)
     9fa:	6402                	ld	s0,0(sp)
     9fc:	0141                	addi	sp,sp,16
     9fe:	8082                	ret

0000000000000a00 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
     a00:	7179                	addi	sp,sp,-48
     a02:	f422                	sd	s0,40(sp)
     a04:	1800                	addi	s0,sp,48
     a06:	fca43c23          	sd	a0,-40(s0)
     a0a:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
     a0e:	fd843783          	ld	a5,-40(s0)
     a12:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
     a16:	0001                	nop
     a18:	fd043703          	ld	a4,-48(s0)
     a1c:	00170793          	addi	a5,a4,1
     a20:	fcf43823          	sd	a5,-48(s0)
     a24:	fd843783          	ld	a5,-40(s0)
     a28:	00178693          	addi	a3,a5,1
     a2c:	fcd43c23          	sd	a3,-40(s0)
     a30:	00074703          	lbu	a4,0(a4)
     a34:	00e78023          	sb	a4,0(a5)
     a38:	0007c783          	lbu	a5,0(a5)
     a3c:	fff1                	bnez	a5,a18 <strcpy+0x18>
    ;
  return os;
     a3e:	fe843783          	ld	a5,-24(s0)
}
     a42:	853e                	mv	a0,a5
     a44:	7422                	ld	s0,40(sp)
     a46:	6145                	addi	sp,sp,48
     a48:	8082                	ret

0000000000000a4a <strcmp>:

int
strcmp(const char *p, const char *q)
{
     a4a:	1101                	addi	sp,sp,-32
     a4c:	ec22                	sd	s0,24(sp)
     a4e:	1000                	addi	s0,sp,32
     a50:	fea43423          	sd	a0,-24(s0)
     a54:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     a58:	a819                	j	a6e <strcmp+0x24>
    p++, q++;
     a5a:	fe843783          	ld	a5,-24(s0)
     a5e:	0785                	addi	a5,a5,1
     a60:	fef43423          	sd	a5,-24(s0)
     a64:	fe043783          	ld	a5,-32(s0)
     a68:	0785                	addi	a5,a5,1
     a6a:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     a6e:	fe843783          	ld	a5,-24(s0)
     a72:	0007c783          	lbu	a5,0(a5)
     a76:	cb99                	beqz	a5,a8c <strcmp+0x42>
     a78:	fe843783          	ld	a5,-24(s0)
     a7c:	0007c703          	lbu	a4,0(a5)
     a80:	fe043783          	ld	a5,-32(s0)
     a84:	0007c783          	lbu	a5,0(a5)
     a88:	fcf709e3          	beq	a4,a5,a5a <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     a8c:	fe843783          	ld	a5,-24(s0)
     a90:	0007c783          	lbu	a5,0(a5)
     a94:	0007871b          	sext.w	a4,a5
     a98:	fe043783          	ld	a5,-32(s0)
     a9c:	0007c783          	lbu	a5,0(a5)
     aa0:	2781                	sext.w	a5,a5
     aa2:	40f707bb          	subw	a5,a4,a5
     aa6:	2781                	sext.w	a5,a5
}
     aa8:	853e                	mv	a0,a5
     aaa:	6462                	ld	s0,24(sp)
     aac:	6105                	addi	sp,sp,32
     aae:	8082                	ret

0000000000000ab0 <strlen>:

uint
strlen(const char *s)
{
     ab0:	7179                	addi	sp,sp,-48
     ab2:	f422                	sd	s0,40(sp)
     ab4:	1800                	addi	s0,sp,48
     ab6:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     aba:	fe042623          	sw	zero,-20(s0)
     abe:	a031                	j	aca <strlen+0x1a>
     ac0:	fec42783          	lw	a5,-20(s0)
     ac4:	2785                	addiw	a5,a5,1
     ac6:	fef42623          	sw	a5,-20(s0)
     aca:	fec42783          	lw	a5,-20(s0)
     ace:	fd843703          	ld	a4,-40(s0)
     ad2:	97ba                	add	a5,a5,a4
     ad4:	0007c783          	lbu	a5,0(a5)
     ad8:	f7e5                	bnez	a5,ac0 <strlen+0x10>
    ;
  return n;
     ada:	fec42783          	lw	a5,-20(s0)
}
     ade:	853e                	mv	a0,a5
     ae0:	7422                	ld	s0,40(sp)
     ae2:	6145                	addi	sp,sp,48
     ae4:	8082                	ret

0000000000000ae6 <memset>:

void*
memset(void *dst, int c, uint n)
{
     ae6:	7179                	addi	sp,sp,-48
     ae8:	f422                	sd	s0,40(sp)
     aea:	1800                	addi	s0,sp,48
     aec:	fca43c23          	sd	a0,-40(s0)
     af0:	87ae                	mv	a5,a1
     af2:	8732                	mv	a4,a2
     af4:	fcf42a23          	sw	a5,-44(s0)
     af8:	87ba                	mv	a5,a4
     afa:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     afe:	fd843783          	ld	a5,-40(s0)
     b02:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     b06:	fe042623          	sw	zero,-20(s0)
     b0a:	a00d                	j	b2c <memset+0x46>
    cdst[i] = c;
     b0c:	fec42783          	lw	a5,-20(s0)
     b10:	fe043703          	ld	a4,-32(s0)
     b14:	97ba                	add	a5,a5,a4
     b16:	fd442703          	lw	a4,-44(s0)
     b1a:	0ff77713          	andi	a4,a4,255
     b1e:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     b22:	fec42783          	lw	a5,-20(s0)
     b26:	2785                	addiw	a5,a5,1
     b28:	fef42623          	sw	a5,-20(s0)
     b2c:	fec42703          	lw	a4,-20(s0)
     b30:	fd042783          	lw	a5,-48(s0)
     b34:	2781                	sext.w	a5,a5
     b36:	fcf76be3          	bltu	a4,a5,b0c <memset+0x26>
  }
  return dst;
     b3a:	fd843783          	ld	a5,-40(s0)
}
     b3e:	853e                	mv	a0,a5
     b40:	7422                	ld	s0,40(sp)
     b42:	6145                	addi	sp,sp,48
     b44:	8082                	ret

0000000000000b46 <strchr>:

char*
strchr(const char *s, char c)
{
     b46:	1101                	addi	sp,sp,-32
     b48:	ec22                	sd	s0,24(sp)
     b4a:	1000                	addi	s0,sp,32
     b4c:	fea43423          	sd	a0,-24(s0)
     b50:	87ae                	mv	a5,a1
     b52:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     b56:	a01d                	j	b7c <strchr+0x36>
    if(*s == c)
     b58:	fe843783          	ld	a5,-24(s0)
     b5c:	0007c703          	lbu	a4,0(a5)
     b60:	fe744783          	lbu	a5,-25(s0)
     b64:	0ff7f793          	andi	a5,a5,255
     b68:	00e79563          	bne	a5,a4,b72 <strchr+0x2c>
      return (char*)s;
     b6c:	fe843783          	ld	a5,-24(s0)
     b70:	a821                	j	b88 <strchr+0x42>
  for(; *s; s++)
     b72:	fe843783          	ld	a5,-24(s0)
     b76:	0785                	addi	a5,a5,1
     b78:	fef43423          	sd	a5,-24(s0)
     b7c:	fe843783          	ld	a5,-24(s0)
     b80:	0007c783          	lbu	a5,0(a5)
     b84:	fbf1                	bnez	a5,b58 <strchr+0x12>
  return 0;
     b86:	4781                	li	a5,0
}
     b88:	853e                	mv	a0,a5
     b8a:	6462                	ld	s0,24(sp)
     b8c:	6105                	addi	sp,sp,32
     b8e:	8082                	ret

0000000000000b90 <gets>:

char*
gets(char *buf, int max)
{
     b90:	7179                	addi	sp,sp,-48
     b92:	f406                	sd	ra,40(sp)
     b94:	f022                	sd	s0,32(sp)
     b96:	1800                	addi	s0,sp,48
     b98:	fca43c23          	sd	a0,-40(s0)
     b9c:	87ae                	mv	a5,a1
     b9e:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     ba2:	fe042623          	sw	zero,-20(s0)
     ba6:	a8a1                	j	bfe <gets+0x6e>
    cc = read(0, &c, 1);
     ba8:	fe740793          	addi	a5,s0,-25
     bac:	4605                	li	a2,1
     bae:	85be                	mv	a1,a5
     bb0:	4501                	li	a0,0
     bb2:	00000097          	auipc	ra,0x0
     bb6:	2f6080e7          	jalr	758(ra) # ea8 <read>
     bba:	87aa                	mv	a5,a0
     bbc:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     bc0:	fe842783          	lw	a5,-24(s0)
     bc4:	2781                	sext.w	a5,a5
     bc6:	04f05763          	blez	a5,c14 <gets+0x84>
      break;
    buf[i++] = c;
     bca:	fec42783          	lw	a5,-20(s0)
     bce:	0017871b          	addiw	a4,a5,1
     bd2:	fee42623          	sw	a4,-20(s0)
     bd6:	873e                	mv	a4,a5
     bd8:	fd843783          	ld	a5,-40(s0)
     bdc:	97ba                	add	a5,a5,a4
     bde:	fe744703          	lbu	a4,-25(s0)
     be2:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     be6:	fe744783          	lbu	a5,-25(s0)
     bea:	873e                	mv	a4,a5
     bec:	47a9                	li	a5,10
     bee:	02f70463          	beq	a4,a5,c16 <gets+0x86>
     bf2:	fe744783          	lbu	a5,-25(s0)
     bf6:	873e                	mv	a4,a5
     bf8:	47b5                	li	a5,13
     bfa:	00f70e63          	beq	a4,a5,c16 <gets+0x86>
  for(i=0; i+1 < max; ){
     bfe:	fec42783          	lw	a5,-20(s0)
     c02:	2785                	addiw	a5,a5,1
     c04:	0007871b          	sext.w	a4,a5
     c08:	fd442783          	lw	a5,-44(s0)
     c0c:	2781                	sext.w	a5,a5
     c0e:	f8f74de3          	blt	a4,a5,ba8 <gets+0x18>
     c12:	a011                	j	c16 <gets+0x86>
      break;
     c14:	0001                	nop
      break;
  }
  buf[i] = '\0';
     c16:	fec42783          	lw	a5,-20(s0)
     c1a:	fd843703          	ld	a4,-40(s0)
     c1e:	97ba                	add	a5,a5,a4
     c20:	00078023          	sb	zero,0(a5)
  return buf;
     c24:	fd843783          	ld	a5,-40(s0)
}
     c28:	853e                	mv	a0,a5
     c2a:	70a2                	ld	ra,40(sp)
     c2c:	7402                	ld	s0,32(sp)
     c2e:	6145                	addi	sp,sp,48
     c30:	8082                	ret

0000000000000c32 <stat>:

int
stat(const char *n, struct stat *st)
{
     c32:	7179                	addi	sp,sp,-48
     c34:	f406                	sd	ra,40(sp)
     c36:	f022                	sd	s0,32(sp)
     c38:	1800                	addi	s0,sp,48
     c3a:	fca43c23          	sd	a0,-40(s0)
     c3e:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     c42:	4581                	li	a1,0
     c44:	fd843503          	ld	a0,-40(s0)
     c48:	00000097          	auipc	ra,0x0
     c4c:	288080e7          	jalr	648(ra) # ed0 <open>
     c50:	87aa                	mv	a5,a0
     c52:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     c56:	fec42783          	lw	a5,-20(s0)
     c5a:	2781                	sext.w	a5,a5
     c5c:	0007d463          	bgez	a5,c64 <stat+0x32>
    return -1;
     c60:	57fd                	li	a5,-1
     c62:	a035                	j	c8e <stat+0x5c>
  r = fstat(fd, st);
     c64:	fec42783          	lw	a5,-20(s0)
     c68:	fd043583          	ld	a1,-48(s0)
     c6c:	853e                	mv	a0,a5
     c6e:	00000097          	auipc	ra,0x0
     c72:	27a080e7          	jalr	634(ra) # ee8 <fstat>
     c76:	87aa                	mv	a5,a0
     c78:	fef42423          	sw	a5,-24(s0)
  close(fd);
     c7c:	fec42783          	lw	a5,-20(s0)
     c80:	853e                	mv	a0,a5
     c82:	00000097          	auipc	ra,0x0
     c86:	236080e7          	jalr	566(ra) # eb8 <close>
  return r;
     c8a:	fe842783          	lw	a5,-24(s0)
}
     c8e:	853e                	mv	a0,a5
     c90:	70a2                	ld	ra,40(sp)
     c92:	7402                	ld	s0,32(sp)
     c94:	6145                	addi	sp,sp,48
     c96:	8082                	ret

0000000000000c98 <atoi>:

int
atoi(const char *s)
{
     c98:	7179                	addi	sp,sp,-48
     c9a:	f422                	sd	s0,40(sp)
     c9c:	1800                	addi	s0,sp,48
     c9e:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     ca2:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     ca6:	a815                	j	cda <atoi+0x42>
    n = n*10 + *s++ - '0';
     ca8:	fec42703          	lw	a4,-20(s0)
     cac:	87ba                	mv	a5,a4
     cae:	0027979b          	slliw	a5,a5,0x2
     cb2:	9fb9                	addw	a5,a5,a4
     cb4:	0017979b          	slliw	a5,a5,0x1
     cb8:	0007871b          	sext.w	a4,a5
     cbc:	fd843783          	ld	a5,-40(s0)
     cc0:	00178693          	addi	a3,a5,1
     cc4:	fcd43c23          	sd	a3,-40(s0)
     cc8:	0007c783          	lbu	a5,0(a5)
     ccc:	2781                	sext.w	a5,a5
     cce:	9fb9                	addw	a5,a5,a4
     cd0:	2781                	sext.w	a5,a5
     cd2:	fd07879b          	addiw	a5,a5,-48
     cd6:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     cda:	fd843783          	ld	a5,-40(s0)
     cde:	0007c783          	lbu	a5,0(a5)
     ce2:	873e                	mv	a4,a5
     ce4:	02f00793          	li	a5,47
     ce8:	00e7fb63          	bgeu	a5,a4,cfe <atoi+0x66>
     cec:	fd843783          	ld	a5,-40(s0)
     cf0:	0007c783          	lbu	a5,0(a5)
     cf4:	873e                	mv	a4,a5
     cf6:	03900793          	li	a5,57
     cfa:	fae7f7e3          	bgeu	a5,a4,ca8 <atoi+0x10>
  return n;
     cfe:	fec42783          	lw	a5,-20(s0)
}
     d02:	853e                	mv	a0,a5
     d04:	7422                	ld	s0,40(sp)
     d06:	6145                	addi	sp,sp,48
     d08:	8082                	ret

0000000000000d0a <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     d0a:	7139                	addi	sp,sp,-64
     d0c:	fc22                	sd	s0,56(sp)
     d0e:	0080                	addi	s0,sp,64
     d10:	fca43c23          	sd	a0,-40(s0)
     d14:	fcb43823          	sd	a1,-48(s0)
     d18:	87b2                	mv	a5,a2
     d1a:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     d1e:	fd843783          	ld	a5,-40(s0)
     d22:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     d26:	fd043783          	ld	a5,-48(s0)
     d2a:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     d2e:	fe043703          	ld	a4,-32(s0)
     d32:	fe843783          	ld	a5,-24(s0)
     d36:	02e7fc63          	bgeu	a5,a4,d6e <memmove+0x64>
    while(n-- > 0)
     d3a:	a00d                	j	d5c <memmove+0x52>
      *dst++ = *src++;
     d3c:	fe043703          	ld	a4,-32(s0)
     d40:	00170793          	addi	a5,a4,1
     d44:	fef43023          	sd	a5,-32(s0)
     d48:	fe843783          	ld	a5,-24(s0)
     d4c:	00178693          	addi	a3,a5,1
     d50:	fed43423          	sd	a3,-24(s0)
     d54:	00074703          	lbu	a4,0(a4)
     d58:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     d5c:	fcc42783          	lw	a5,-52(s0)
     d60:	fff7871b          	addiw	a4,a5,-1
     d64:	fce42623          	sw	a4,-52(s0)
     d68:	fcf04ae3          	bgtz	a5,d3c <memmove+0x32>
     d6c:	a891                	j	dc0 <memmove+0xb6>
  } else {
    dst += n;
     d6e:	fcc42783          	lw	a5,-52(s0)
     d72:	fe843703          	ld	a4,-24(s0)
     d76:	97ba                	add	a5,a5,a4
     d78:	fef43423          	sd	a5,-24(s0)
    src += n;
     d7c:	fcc42783          	lw	a5,-52(s0)
     d80:	fe043703          	ld	a4,-32(s0)
     d84:	97ba                	add	a5,a5,a4
     d86:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     d8a:	a01d                	j	db0 <memmove+0xa6>
      *--dst = *--src;
     d8c:	fe043783          	ld	a5,-32(s0)
     d90:	17fd                	addi	a5,a5,-1
     d92:	fef43023          	sd	a5,-32(s0)
     d96:	fe843783          	ld	a5,-24(s0)
     d9a:	17fd                	addi	a5,a5,-1
     d9c:	fef43423          	sd	a5,-24(s0)
     da0:	fe043783          	ld	a5,-32(s0)
     da4:	0007c703          	lbu	a4,0(a5)
     da8:	fe843783          	ld	a5,-24(s0)
     dac:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     db0:	fcc42783          	lw	a5,-52(s0)
     db4:	fff7871b          	addiw	a4,a5,-1
     db8:	fce42623          	sw	a4,-52(s0)
     dbc:	fcf048e3          	bgtz	a5,d8c <memmove+0x82>
  }
  return vdst;
     dc0:	fd843783          	ld	a5,-40(s0)
}
     dc4:	853e                	mv	a0,a5
     dc6:	7462                	ld	s0,56(sp)
     dc8:	6121                	addi	sp,sp,64
     dca:	8082                	ret

0000000000000dcc <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     dcc:	7139                	addi	sp,sp,-64
     dce:	fc22                	sd	s0,56(sp)
     dd0:	0080                	addi	s0,sp,64
     dd2:	fca43c23          	sd	a0,-40(s0)
     dd6:	fcb43823          	sd	a1,-48(s0)
     dda:	87b2                	mv	a5,a2
     ddc:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     de0:	fd843783          	ld	a5,-40(s0)
     de4:	fef43423          	sd	a5,-24(s0)
     de8:	fd043783          	ld	a5,-48(s0)
     dec:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     df0:	a0a1                	j	e38 <memcmp+0x6c>
    if (*p1 != *p2) {
     df2:	fe843783          	ld	a5,-24(s0)
     df6:	0007c703          	lbu	a4,0(a5)
     dfa:	fe043783          	ld	a5,-32(s0)
     dfe:	0007c783          	lbu	a5,0(a5)
     e02:	02f70163          	beq	a4,a5,e24 <memcmp+0x58>
      return *p1 - *p2;
     e06:	fe843783          	ld	a5,-24(s0)
     e0a:	0007c783          	lbu	a5,0(a5)
     e0e:	0007871b          	sext.w	a4,a5
     e12:	fe043783          	ld	a5,-32(s0)
     e16:	0007c783          	lbu	a5,0(a5)
     e1a:	2781                	sext.w	a5,a5
     e1c:	40f707bb          	subw	a5,a4,a5
     e20:	2781                	sext.w	a5,a5
     e22:	a01d                	j	e48 <memcmp+0x7c>
    }
    p1++;
     e24:	fe843783          	ld	a5,-24(s0)
     e28:	0785                	addi	a5,a5,1
     e2a:	fef43423          	sd	a5,-24(s0)
    p2++;
     e2e:	fe043783          	ld	a5,-32(s0)
     e32:	0785                	addi	a5,a5,1
     e34:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     e38:	fcc42783          	lw	a5,-52(s0)
     e3c:	fff7871b          	addiw	a4,a5,-1
     e40:	fce42623          	sw	a4,-52(s0)
     e44:	f7dd                	bnez	a5,df2 <memcmp+0x26>
  }
  return 0;
     e46:	4781                	li	a5,0
}
     e48:	853e                	mv	a0,a5
     e4a:	7462                	ld	s0,56(sp)
     e4c:	6121                	addi	sp,sp,64
     e4e:	8082                	ret

0000000000000e50 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     e50:	7179                	addi	sp,sp,-48
     e52:	f406                	sd	ra,40(sp)
     e54:	f022                	sd	s0,32(sp)
     e56:	1800                	addi	s0,sp,48
     e58:	fea43423          	sd	a0,-24(s0)
     e5c:	feb43023          	sd	a1,-32(s0)
     e60:	87b2                	mv	a5,a2
     e62:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     e66:	fdc42783          	lw	a5,-36(s0)
     e6a:	863e                	mv	a2,a5
     e6c:	fe043583          	ld	a1,-32(s0)
     e70:	fe843503          	ld	a0,-24(s0)
     e74:	00000097          	auipc	ra,0x0
     e78:	e96080e7          	jalr	-362(ra) # d0a <memmove>
     e7c:	87aa                	mv	a5,a0
}
     e7e:	853e                	mv	a0,a5
     e80:	70a2                	ld	ra,40(sp)
     e82:	7402                	ld	s0,32(sp)
     e84:	6145                	addi	sp,sp,48
     e86:	8082                	ret

0000000000000e88 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     e88:	4885                	li	a7,1
 ecall
     e8a:	00000073          	ecall
 ret
     e8e:	8082                	ret

0000000000000e90 <exit>:
.global exit
exit:
 li a7, SYS_exit
     e90:	4889                	li	a7,2
 ecall
     e92:	00000073          	ecall
 ret
     e96:	8082                	ret

0000000000000e98 <wait>:
.global wait
wait:
 li a7, SYS_wait
     e98:	488d                	li	a7,3
 ecall
     e9a:	00000073          	ecall
 ret
     e9e:	8082                	ret

0000000000000ea0 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     ea0:	4891                	li	a7,4
 ecall
     ea2:	00000073          	ecall
 ret
     ea6:	8082                	ret

0000000000000ea8 <read>:
.global read
read:
 li a7, SYS_read
     ea8:	4895                	li	a7,5
 ecall
     eaa:	00000073          	ecall
 ret
     eae:	8082                	ret

0000000000000eb0 <write>:
.global write
write:
 li a7, SYS_write
     eb0:	48c1                	li	a7,16
 ecall
     eb2:	00000073          	ecall
 ret
     eb6:	8082                	ret

0000000000000eb8 <close>:
.global close
close:
 li a7, SYS_close
     eb8:	48d5                	li	a7,21
 ecall
     eba:	00000073          	ecall
 ret
     ebe:	8082                	ret

0000000000000ec0 <kill>:
.global kill
kill:
 li a7, SYS_kill
     ec0:	4899                	li	a7,6
 ecall
     ec2:	00000073          	ecall
 ret
     ec6:	8082                	ret

0000000000000ec8 <exec>:
.global exec
exec:
 li a7, SYS_exec
     ec8:	489d                	li	a7,7
 ecall
     eca:	00000073          	ecall
 ret
     ece:	8082                	ret

0000000000000ed0 <open>:
.global open
open:
 li a7, SYS_open
     ed0:	48bd                	li	a7,15
 ecall
     ed2:	00000073          	ecall
 ret
     ed6:	8082                	ret

0000000000000ed8 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     ed8:	48c5                	li	a7,17
 ecall
     eda:	00000073          	ecall
 ret
     ede:	8082                	ret

0000000000000ee0 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     ee0:	48c9                	li	a7,18
 ecall
     ee2:	00000073          	ecall
 ret
     ee6:	8082                	ret

0000000000000ee8 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     ee8:	48a1                	li	a7,8
 ecall
     eea:	00000073          	ecall
 ret
     eee:	8082                	ret

0000000000000ef0 <link>:
.global link
link:
 li a7, SYS_link
     ef0:	48cd                	li	a7,19
 ecall
     ef2:	00000073          	ecall
 ret
     ef6:	8082                	ret

0000000000000ef8 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     ef8:	48d1                	li	a7,20
 ecall
     efa:	00000073          	ecall
 ret
     efe:	8082                	ret

0000000000000f00 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     f00:	48a5                	li	a7,9
 ecall
     f02:	00000073          	ecall
 ret
     f06:	8082                	ret

0000000000000f08 <dup>:
.global dup
dup:
 li a7, SYS_dup
     f08:	48a9                	li	a7,10
 ecall
     f0a:	00000073          	ecall
 ret
     f0e:	8082                	ret

0000000000000f10 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     f10:	48ad                	li	a7,11
 ecall
     f12:	00000073          	ecall
 ret
     f16:	8082                	ret

0000000000000f18 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     f18:	48b1                	li	a7,12
 ecall
     f1a:	00000073          	ecall
 ret
     f1e:	8082                	ret

0000000000000f20 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     f20:	48b5                	li	a7,13
 ecall
     f22:	00000073          	ecall
 ret
     f26:	8082                	ret

0000000000000f28 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     f28:	48b9                	li	a7,14
 ecall
     f2a:	00000073          	ecall
 ret
     f2e:	8082                	ret

0000000000000f30 <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
     f30:	48d9                	li	a7,22
 ecall
     f32:	00000073          	ecall
 ret
     f36:	8082                	ret

0000000000000f38 <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
     f38:	48dd                	li	a7,23
 ecall
     f3a:	00000073          	ecall
 ret
     f3e:	8082                	ret

0000000000000f40 <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
     f40:	48e1                	li	a7,24
 ecall
     f42:	00000073          	ecall
 ret
     f46:	8082                	ret

0000000000000f48 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     f48:	1101                	addi	sp,sp,-32
     f4a:	ec06                	sd	ra,24(sp)
     f4c:	e822                	sd	s0,16(sp)
     f4e:	1000                	addi	s0,sp,32
     f50:	87aa                	mv	a5,a0
     f52:	872e                	mv	a4,a1
     f54:	fef42623          	sw	a5,-20(s0)
     f58:	87ba                	mv	a5,a4
     f5a:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     f5e:	feb40713          	addi	a4,s0,-21
     f62:	fec42783          	lw	a5,-20(s0)
     f66:	4605                	li	a2,1
     f68:	85ba                	mv	a1,a4
     f6a:	853e                	mv	a0,a5
     f6c:	00000097          	auipc	ra,0x0
     f70:	f44080e7          	jalr	-188(ra) # eb0 <write>
}
     f74:	0001                	nop
     f76:	60e2                	ld	ra,24(sp)
     f78:	6442                	ld	s0,16(sp)
     f7a:	6105                	addi	sp,sp,32
     f7c:	8082                	ret

0000000000000f7e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     f7e:	7139                	addi	sp,sp,-64
     f80:	fc06                	sd	ra,56(sp)
     f82:	f822                	sd	s0,48(sp)
     f84:	0080                	addi	s0,sp,64
     f86:	87aa                	mv	a5,a0
     f88:	8736                	mv	a4,a3
     f8a:	fcf42623          	sw	a5,-52(s0)
     f8e:	87ae                	mv	a5,a1
     f90:	fcf42423          	sw	a5,-56(s0)
     f94:	87b2                	mv	a5,a2
     f96:	fcf42223          	sw	a5,-60(s0)
     f9a:	87ba                	mv	a5,a4
     f9c:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     fa0:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     fa4:	fc042783          	lw	a5,-64(s0)
     fa8:	2781                	sext.w	a5,a5
     faa:	c38d                	beqz	a5,fcc <printint+0x4e>
     fac:	fc842783          	lw	a5,-56(s0)
     fb0:	2781                	sext.w	a5,a5
     fb2:	0007dd63          	bgez	a5,fcc <printint+0x4e>
    neg = 1;
     fb6:	4785                	li	a5,1
     fb8:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     fbc:	fc842783          	lw	a5,-56(s0)
     fc0:	40f007bb          	negw	a5,a5
     fc4:	2781                	sext.w	a5,a5
     fc6:	fef42223          	sw	a5,-28(s0)
     fca:	a029                	j	fd4 <printint+0x56>
  } else {
    x = xx;
     fcc:	fc842783          	lw	a5,-56(s0)
     fd0:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     fd4:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     fd8:	fc442783          	lw	a5,-60(s0)
     fdc:	fe442703          	lw	a4,-28(s0)
     fe0:	02f777bb          	remuw	a5,a4,a5
     fe4:	0007861b          	sext.w	a2,a5
     fe8:	fec42783          	lw	a5,-20(s0)
     fec:	0017871b          	addiw	a4,a5,1
     ff0:	fee42623          	sw	a4,-20(s0)
     ff4:	00001697          	auipc	a3,0x1
     ff8:	f2468693          	addi	a3,a3,-220 # 1f18 <digits>
     ffc:	02061713          	slli	a4,a2,0x20
    1000:	9301                	srli	a4,a4,0x20
    1002:	9736                	add	a4,a4,a3
    1004:	00074703          	lbu	a4,0(a4)
    1008:	ff040693          	addi	a3,s0,-16
    100c:	97b6                	add	a5,a5,a3
    100e:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
    1012:	fc442783          	lw	a5,-60(s0)
    1016:	fe442703          	lw	a4,-28(s0)
    101a:	02f757bb          	divuw	a5,a4,a5
    101e:	fef42223          	sw	a5,-28(s0)
    1022:	fe442783          	lw	a5,-28(s0)
    1026:	2781                	sext.w	a5,a5
    1028:	fbc5                	bnez	a5,fd8 <printint+0x5a>
  if(neg)
    102a:	fe842783          	lw	a5,-24(s0)
    102e:	2781                	sext.w	a5,a5
    1030:	cf95                	beqz	a5,106c <printint+0xee>
    buf[i++] = '-';
    1032:	fec42783          	lw	a5,-20(s0)
    1036:	0017871b          	addiw	a4,a5,1
    103a:	fee42623          	sw	a4,-20(s0)
    103e:	ff040713          	addi	a4,s0,-16
    1042:	97ba                	add	a5,a5,a4
    1044:	02d00713          	li	a4,45
    1048:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
    104c:	a005                	j	106c <printint+0xee>
    putc(fd, buf[i]);
    104e:	fec42783          	lw	a5,-20(s0)
    1052:	ff040713          	addi	a4,s0,-16
    1056:	97ba                	add	a5,a5,a4
    1058:	fe07c703          	lbu	a4,-32(a5)
    105c:	fcc42783          	lw	a5,-52(s0)
    1060:	85ba                	mv	a1,a4
    1062:	853e                	mv	a0,a5
    1064:	00000097          	auipc	ra,0x0
    1068:	ee4080e7          	jalr	-284(ra) # f48 <putc>
  while(--i >= 0)
    106c:	fec42783          	lw	a5,-20(s0)
    1070:	37fd                	addiw	a5,a5,-1
    1072:	fef42623          	sw	a5,-20(s0)
    1076:	fec42783          	lw	a5,-20(s0)
    107a:	2781                	sext.w	a5,a5
    107c:	fc07d9e3          	bgez	a5,104e <printint+0xd0>
}
    1080:	0001                	nop
    1082:	0001                	nop
    1084:	70e2                	ld	ra,56(sp)
    1086:	7442                	ld	s0,48(sp)
    1088:	6121                	addi	sp,sp,64
    108a:	8082                	ret

000000000000108c <printptr>:

static void
printptr(int fd, uint64 x) {
    108c:	7179                	addi	sp,sp,-48
    108e:	f406                	sd	ra,40(sp)
    1090:	f022                	sd	s0,32(sp)
    1092:	1800                	addi	s0,sp,48
    1094:	87aa                	mv	a5,a0
    1096:	fcb43823          	sd	a1,-48(s0)
    109a:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
    109e:	fdc42783          	lw	a5,-36(s0)
    10a2:	03000593          	li	a1,48
    10a6:	853e                	mv	a0,a5
    10a8:	00000097          	auipc	ra,0x0
    10ac:	ea0080e7          	jalr	-352(ra) # f48 <putc>
  putc(fd, 'x');
    10b0:	fdc42783          	lw	a5,-36(s0)
    10b4:	07800593          	li	a1,120
    10b8:	853e                	mv	a0,a5
    10ba:	00000097          	auipc	ra,0x0
    10be:	e8e080e7          	jalr	-370(ra) # f48 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    10c2:	fe042623          	sw	zero,-20(s0)
    10c6:	a82d                	j	1100 <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
    10c8:	fd043783          	ld	a5,-48(s0)
    10cc:	93f1                	srli	a5,a5,0x3c
    10ce:	00001717          	auipc	a4,0x1
    10d2:	e4a70713          	addi	a4,a4,-438 # 1f18 <digits>
    10d6:	97ba                	add	a5,a5,a4
    10d8:	0007c703          	lbu	a4,0(a5)
    10dc:	fdc42783          	lw	a5,-36(s0)
    10e0:	85ba                	mv	a1,a4
    10e2:	853e                	mv	a0,a5
    10e4:	00000097          	auipc	ra,0x0
    10e8:	e64080e7          	jalr	-412(ra) # f48 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    10ec:	fec42783          	lw	a5,-20(s0)
    10f0:	2785                	addiw	a5,a5,1
    10f2:	fef42623          	sw	a5,-20(s0)
    10f6:	fd043783          	ld	a5,-48(s0)
    10fa:	0792                	slli	a5,a5,0x4
    10fc:	fcf43823          	sd	a5,-48(s0)
    1100:	fec42783          	lw	a5,-20(s0)
    1104:	873e                	mv	a4,a5
    1106:	47bd                	li	a5,15
    1108:	fce7f0e3          	bgeu	a5,a4,10c8 <printptr+0x3c>
}
    110c:	0001                	nop
    110e:	0001                	nop
    1110:	70a2                	ld	ra,40(sp)
    1112:	7402                	ld	s0,32(sp)
    1114:	6145                	addi	sp,sp,48
    1116:	8082                	ret

0000000000001118 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
    1118:	715d                	addi	sp,sp,-80
    111a:	e486                	sd	ra,72(sp)
    111c:	e0a2                	sd	s0,64(sp)
    111e:	0880                	addi	s0,sp,80
    1120:	87aa                	mv	a5,a0
    1122:	fcb43023          	sd	a1,-64(s0)
    1126:	fac43c23          	sd	a2,-72(s0)
    112a:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
    112e:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
    1132:	fe042223          	sw	zero,-28(s0)
    1136:	a42d                	j	1360 <vprintf+0x248>
    c = fmt[i] & 0xff;
    1138:	fe442783          	lw	a5,-28(s0)
    113c:	fc043703          	ld	a4,-64(s0)
    1140:	97ba                	add	a5,a5,a4
    1142:	0007c783          	lbu	a5,0(a5)
    1146:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
    114a:	fe042783          	lw	a5,-32(s0)
    114e:	2781                	sext.w	a5,a5
    1150:	eb9d                	bnez	a5,1186 <vprintf+0x6e>
      if(c == '%'){
    1152:	fdc42783          	lw	a5,-36(s0)
    1156:	0007871b          	sext.w	a4,a5
    115a:	02500793          	li	a5,37
    115e:	00f71763          	bne	a4,a5,116c <vprintf+0x54>
        state = '%';
    1162:	02500793          	li	a5,37
    1166:	fef42023          	sw	a5,-32(s0)
    116a:	a2f5                	j	1356 <vprintf+0x23e>
      } else {
        putc(fd, c);
    116c:	fdc42783          	lw	a5,-36(s0)
    1170:	0ff7f713          	andi	a4,a5,255
    1174:	fcc42783          	lw	a5,-52(s0)
    1178:	85ba                	mv	a1,a4
    117a:	853e                	mv	a0,a5
    117c:	00000097          	auipc	ra,0x0
    1180:	dcc080e7          	jalr	-564(ra) # f48 <putc>
    1184:	aac9                	j	1356 <vprintf+0x23e>
      }
    } else if(state == '%'){
    1186:	fe042783          	lw	a5,-32(s0)
    118a:	0007871b          	sext.w	a4,a5
    118e:	02500793          	li	a5,37
    1192:	1cf71263          	bne	a4,a5,1356 <vprintf+0x23e>
      if(c == 'd'){
    1196:	fdc42783          	lw	a5,-36(s0)
    119a:	0007871b          	sext.w	a4,a5
    119e:	06400793          	li	a5,100
    11a2:	02f71463          	bne	a4,a5,11ca <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
    11a6:	fb843783          	ld	a5,-72(s0)
    11aa:	00878713          	addi	a4,a5,8
    11ae:	fae43c23          	sd	a4,-72(s0)
    11b2:	4398                	lw	a4,0(a5)
    11b4:	fcc42783          	lw	a5,-52(s0)
    11b8:	4685                	li	a3,1
    11ba:	4629                	li	a2,10
    11bc:	85ba                	mv	a1,a4
    11be:	853e                	mv	a0,a5
    11c0:	00000097          	auipc	ra,0x0
    11c4:	dbe080e7          	jalr	-578(ra) # f7e <printint>
    11c8:	a269                	j	1352 <vprintf+0x23a>
      } else if(c == 'l') {
    11ca:	fdc42783          	lw	a5,-36(s0)
    11ce:	0007871b          	sext.w	a4,a5
    11d2:	06c00793          	li	a5,108
    11d6:	02f71663          	bne	a4,a5,1202 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
    11da:	fb843783          	ld	a5,-72(s0)
    11de:	00878713          	addi	a4,a5,8
    11e2:	fae43c23          	sd	a4,-72(s0)
    11e6:	639c                	ld	a5,0(a5)
    11e8:	0007871b          	sext.w	a4,a5
    11ec:	fcc42783          	lw	a5,-52(s0)
    11f0:	4681                	li	a3,0
    11f2:	4629                	li	a2,10
    11f4:	85ba                	mv	a1,a4
    11f6:	853e                	mv	a0,a5
    11f8:	00000097          	auipc	ra,0x0
    11fc:	d86080e7          	jalr	-634(ra) # f7e <printint>
    1200:	aa89                	j	1352 <vprintf+0x23a>
      } else if(c == 'x') {
    1202:	fdc42783          	lw	a5,-36(s0)
    1206:	0007871b          	sext.w	a4,a5
    120a:	07800793          	li	a5,120
    120e:	02f71463          	bne	a4,a5,1236 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
    1212:	fb843783          	ld	a5,-72(s0)
    1216:	00878713          	addi	a4,a5,8
    121a:	fae43c23          	sd	a4,-72(s0)
    121e:	4398                	lw	a4,0(a5)
    1220:	fcc42783          	lw	a5,-52(s0)
    1224:	4681                	li	a3,0
    1226:	4641                	li	a2,16
    1228:	85ba                	mv	a1,a4
    122a:	853e                	mv	a0,a5
    122c:	00000097          	auipc	ra,0x0
    1230:	d52080e7          	jalr	-686(ra) # f7e <printint>
    1234:	aa39                	j	1352 <vprintf+0x23a>
      } else if(c == 'p') {
    1236:	fdc42783          	lw	a5,-36(s0)
    123a:	0007871b          	sext.w	a4,a5
    123e:	07000793          	li	a5,112
    1242:	02f71263          	bne	a4,a5,1266 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
    1246:	fb843783          	ld	a5,-72(s0)
    124a:	00878713          	addi	a4,a5,8
    124e:	fae43c23          	sd	a4,-72(s0)
    1252:	6398                	ld	a4,0(a5)
    1254:	fcc42783          	lw	a5,-52(s0)
    1258:	85ba                	mv	a1,a4
    125a:	853e                	mv	a0,a5
    125c:	00000097          	auipc	ra,0x0
    1260:	e30080e7          	jalr	-464(ra) # 108c <printptr>
    1264:	a0fd                	j	1352 <vprintf+0x23a>
      } else if(c == 's'){
    1266:	fdc42783          	lw	a5,-36(s0)
    126a:	0007871b          	sext.w	a4,a5
    126e:	07300793          	li	a5,115
    1272:	04f71c63          	bne	a4,a5,12ca <vprintf+0x1b2>
        s = va_arg(ap, char*);
    1276:	fb843783          	ld	a5,-72(s0)
    127a:	00878713          	addi	a4,a5,8
    127e:	fae43c23          	sd	a4,-72(s0)
    1282:	639c                	ld	a5,0(a5)
    1284:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
    1288:	fe843783          	ld	a5,-24(s0)
    128c:	eb8d                	bnez	a5,12be <vprintf+0x1a6>
          s = "(null)";
    128e:	00001797          	auipc	a5,0x1
    1292:	c6278793          	addi	a5,a5,-926 # 1ef0 <schedule_rm+0x3e0>
    1296:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
    129a:	a015                	j	12be <vprintf+0x1a6>
          putc(fd, *s);
    129c:	fe843783          	ld	a5,-24(s0)
    12a0:	0007c703          	lbu	a4,0(a5)
    12a4:	fcc42783          	lw	a5,-52(s0)
    12a8:	85ba                	mv	a1,a4
    12aa:	853e                	mv	a0,a5
    12ac:	00000097          	auipc	ra,0x0
    12b0:	c9c080e7          	jalr	-868(ra) # f48 <putc>
          s++;
    12b4:	fe843783          	ld	a5,-24(s0)
    12b8:	0785                	addi	a5,a5,1
    12ba:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
    12be:	fe843783          	ld	a5,-24(s0)
    12c2:	0007c783          	lbu	a5,0(a5)
    12c6:	fbf9                	bnez	a5,129c <vprintf+0x184>
    12c8:	a069                	j	1352 <vprintf+0x23a>
        }
      } else if(c == 'c'){
    12ca:	fdc42783          	lw	a5,-36(s0)
    12ce:	0007871b          	sext.w	a4,a5
    12d2:	06300793          	li	a5,99
    12d6:	02f71463          	bne	a4,a5,12fe <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
    12da:	fb843783          	ld	a5,-72(s0)
    12de:	00878713          	addi	a4,a5,8
    12e2:	fae43c23          	sd	a4,-72(s0)
    12e6:	439c                	lw	a5,0(a5)
    12e8:	0ff7f713          	andi	a4,a5,255
    12ec:	fcc42783          	lw	a5,-52(s0)
    12f0:	85ba                	mv	a1,a4
    12f2:	853e                	mv	a0,a5
    12f4:	00000097          	auipc	ra,0x0
    12f8:	c54080e7          	jalr	-940(ra) # f48 <putc>
    12fc:	a899                	j	1352 <vprintf+0x23a>
      } else if(c == '%'){
    12fe:	fdc42783          	lw	a5,-36(s0)
    1302:	0007871b          	sext.w	a4,a5
    1306:	02500793          	li	a5,37
    130a:	00f71f63          	bne	a4,a5,1328 <vprintf+0x210>
        putc(fd, c);
    130e:	fdc42783          	lw	a5,-36(s0)
    1312:	0ff7f713          	andi	a4,a5,255
    1316:	fcc42783          	lw	a5,-52(s0)
    131a:	85ba                	mv	a1,a4
    131c:	853e                	mv	a0,a5
    131e:	00000097          	auipc	ra,0x0
    1322:	c2a080e7          	jalr	-982(ra) # f48 <putc>
    1326:	a035                	j	1352 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    1328:	fcc42783          	lw	a5,-52(s0)
    132c:	02500593          	li	a1,37
    1330:	853e                	mv	a0,a5
    1332:	00000097          	auipc	ra,0x0
    1336:	c16080e7          	jalr	-1002(ra) # f48 <putc>
        putc(fd, c);
    133a:	fdc42783          	lw	a5,-36(s0)
    133e:	0ff7f713          	andi	a4,a5,255
    1342:	fcc42783          	lw	a5,-52(s0)
    1346:	85ba                	mv	a1,a4
    1348:	853e                	mv	a0,a5
    134a:	00000097          	auipc	ra,0x0
    134e:	bfe080e7          	jalr	-1026(ra) # f48 <putc>
      }
      state = 0;
    1352:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
    1356:	fe442783          	lw	a5,-28(s0)
    135a:	2785                	addiw	a5,a5,1
    135c:	fef42223          	sw	a5,-28(s0)
    1360:	fe442783          	lw	a5,-28(s0)
    1364:	fc043703          	ld	a4,-64(s0)
    1368:	97ba                	add	a5,a5,a4
    136a:	0007c783          	lbu	a5,0(a5)
    136e:	dc0795e3          	bnez	a5,1138 <vprintf+0x20>
    }
  }
}
    1372:	0001                	nop
    1374:	0001                	nop
    1376:	60a6                	ld	ra,72(sp)
    1378:	6406                	ld	s0,64(sp)
    137a:	6161                	addi	sp,sp,80
    137c:	8082                	ret

000000000000137e <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
    137e:	7159                	addi	sp,sp,-112
    1380:	fc06                	sd	ra,56(sp)
    1382:	f822                	sd	s0,48(sp)
    1384:	0080                	addi	s0,sp,64
    1386:	fcb43823          	sd	a1,-48(s0)
    138a:	e010                	sd	a2,0(s0)
    138c:	e414                	sd	a3,8(s0)
    138e:	e818                	sd	a4,16(s0)
    1390:	ec1c                	sd	a5,24(s0)
    1392:	03043023          	sd	a6,32(s0)
    1396:	03143423          	sd	a7,40(s0)
    139a:	87aa                	mv	a5,a0
    139c:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
    13a0:	03040793          	addi	a5,s0,48
    13a4:	fcf43423          	sd	a5,-56(s0)
    13a8:	fc843783          	ld	a5,-56(s0)
    13ac:	fd078793          	addi	a5,a5,-48
    13b0:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
    13b4:	fe843703          	ld	a4,-24(s0)
    13b8:	fdc42783          	lw	a5,-36(s0)
    13bc:	863a                	mv	a2,a4
    13be:	fd043583          	ld	a1,-48(s0)
    13c2:	853e                	mv	a0,a5
    13c4:	00000097          	auipc	ra,0x0
    13c8:	d54080e7          	jalr	-684(ra) # 1118 <vprintf>
}
    13cc:	0001                	nop
    13ce:	70e2                	ld	ra,56(sp)
    13d0:	7442                	ld	s0,48(sp)
    13d2:	6165                	addi	sp,sp,112
    13d4:	8082                	ret

00000000000013d6 <printf>:

void
printf(const char *fmt, ...)
{
    13d6:	7159                	addi	sp,sp,-112
    13d8:	f406                	sd	ra,40(sp)
    13da:	f022                	sd	s0,32(sp)
    13dc:	1800                	addi	s0,sp,48
    13de:	fca43c23          	sd	a0,-40(s0)
    13e2:	e40c                	sd	a1,8(s0)
    13e4:	e810                	sd	a2,16(s0)
    13e6:	ec14                	sd	a3,24(s0)
    13e8:	f018                	sd	a4,32(s0)
    13ea:	f41c                	sd	a5,40(s0)
    13ec:	03043823          	sd	a6,48(s0)
    13f0:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
    13f4:	04040793          	addi	a5,s0,64
    13f8:	fcf43823          	sd	a5,-48(s0)
    13fc:	fd043783          	ld	a5,-48(s0)
    1400:	fc878793          	addi	a5,a5,-56
    1404:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
    1408:	fe843783          	ld	a5,-24(s0)
    140c:	863e                	mv	a2,a5
    140e:	fd843583          	ld	a1,-40(s0)
    1412:	4505                	li	a0,1
    1414:	00000097          	auipc	ra,0x0
    1418:	d04080e7          	jalr	-764(ra) # 1118 <vprintf>
}
    141c:	0001                	nop
    141e:	70a2                	ld	ra,40(sp)
    1420:	7402                	ld	s0,32(sp)
    1422:	6165                	addi	sp,sp,112
    1424:	8082                	ret

0000000000001426 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1426:	7179                	addi	sp,sp,-48
    1428:	f422                	sd	s0,40(sp)
    142a:	1800                	addi	s0,sp,48
    142c:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1430:	fd843783          	ld	a5,-40(s0)
    1434:	17c1                	addi	a5,a5,-16
    1436:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    143a:	00001797          	auipc	a5,0x1
    143e:	b2678793          	addi	a5,a5,-1242 # 1f60 <freep>
    1442:	639c                	ld	a5,0(a5)
    1444:	fef43423          	sd	a5,-24(s0)
    1448:	a815                	j	147c <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    144a:	fe843783          	ld	a5,-24(s0)
    144e:	639c                	ld	a5,0(a5)
    1450:	fe843703          	ld	a4,-24(s0)
    1454:	00f76f63          	bltu	a4,a5,1472 <free+0x4c>
    1458:	fe043703          	ld	a4,-32(s0)
    145c:	fe843783          	ld	a5,-24(s0)
    1460:	02e7eb63          	bltu	a5,a4,1496 <free+0x70>
    1464:	fe843783          	ld	a5,-24(s0)
    1468:	639c                	ld	a5,0(a5)
    146a:	fe043703          	ld	a4,-32(s0)
    146e:	02f76463          	bltu	a4,a5,1496 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1472:	fe843783          	ld	a5,-24(s0)
    1476:	639c                	ld	a5,0(a5)
    1478:	fef43423          	sd	a5,-24(s0)
    147c:	fe043703          	ld	a4,-32(s0)
    1480:	fe843783          	ld	a5,-24(s0)
    1484:	fce7f3e3          	bgeu	a5,a4,144a <free+0x24>
    1488:	fe843783          	ld	a5,-24(s0)
    148c:	639c                	ld	a5,0(a5)
    148e:	fe043703          	ld	a4,-32(s0)
    1492:	faf77ce3          	bgeu	a4,a5,144a <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1496:	fe043783          	ld	a5,-32(s0)
    149a:	479c                	lw	a5,8(a5)
    149c:	1782                	slli	a5,a5,0x20
    149e:	9381                	srli	a5,a5,0x20
    14a0:	0792                	slli	a5,a5,0x4
    14a2:	fe043703          	ld	a4,-32(s0)
    14a6:	973e                	add	a4,a4,a5
    14a8:	fe843783          	ld	a5,-24(s0)
    14ac:	639c                	ld	a5,0(a5)
    14ae:	02f71763          	bne	a4,a5,14dc <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
    14b2:	fe043783          	ld	a5,-32(s0)
    14b6:	4798                	lw	a4,8(a5)
    14b8:	fe843783          	ld	a5,-24(s0)
    14bc:	639c                	ld	a5,0(a5)
    14be:	479c                	lw	a5,8(a5)
    14c0:	9fb9                	addw	a5,a5,a4
    14c2:	0007871b          	sext.w	a4,a5
    14c6:	fe043783          	ld	a5,-32(s0)
    14ca:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
    14cc:	fe843783          	ld	a5,-24(s0)
    14d0:	639c                	ld	a5,0(a5)
    14d2:	6398                	ld	a4,0(a5)
    14d4:	fe043783          	ld	a5,-32(s0)
    14d8:	e398                	sd	a4,0(a5)
    14da:	a039                	j	14e8 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
    14dc:	fe843783          	ld	a5,-24(s0)
    14e0:	6398                	ld	a4,0(a5)
    14e2:	fe043783          	ld	a5,-32(s0)
    14e6:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
    14e8:	fe843783          	ld	a5,-24(s0)
    14ec:	479c                	lw	a5,8(a5)
    14ee:	1782                	slli	a5,a5,0x20
    14f0:	9381                	srli	a5,a5,0x20
    14f2:	0792                	slli	a5,a5,0x4
    14f4:	fe843703          	ld	a4,-24(s0)
    14f8:	97ba                	add	a5,a5,a4
    14fa:	fe043703          	ld	a4,-32(s0)
    14fe:	02f71563          	bne	a4,a5,1528 <free+0x102>
    p->s.size += bp->s.size;
    1502:	fe843783          	ld	a5,-24(s0)
    1506:	4798                	lw	a4,8(a5)
    1508:	fe043783          	ld	a5,-32(s0)
    150c:	479c                	lw	a5,8(a5)
    150e:	9fb9                	addw	a5,a5,a4
    1510:	0007871b          	sext.w	a4,a5
    1514:	fe843783          	ld	a5,-24(s0)
    1518:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
    151a:	fe043783          	ld	a5,-32(s0)
    151e:	6398                	ld	a4,0(a5)
    1520:	fe843783          	ld	a5,-24(s0)
    1524:	e398                	sd	a4,0(a5)
    1526:	a031                	j	1532 <free+0x10c>
  } else
    p->s.ptr = bp;
    1528:	fe843783          	ld	a5,-24(s0)
    152c:	fe043703          	ld	a4,-32(s0)
    1530:	e398                	sd	a4,0(a5)
  freep = p;
    1532:	00001797          	auipc	a5,0x1
    1536:	a2e78793          	addi	a5,a5,-1490 # 1f60 <freep>
    153a:	fe843703          	ld	a4,-24(s0)
    153e:	e398                	sd	a4,0(a5)
}
    1540:	0001                	nop
    1542:	7422                	ld	s0,40(sp)
    1544:	6145                	addi	sp,sp,48
    1546:	8082                	ret

0000000000001548 <morecore>:

static Header*
morecore(uint nu)
{
    1548:	7179                	addi	sp,sp,-48
    154a:	f406                	sd	ra,40(sp)
    154c:	f022                	sd	s0,32(sp)
    154e:	1800                	addi	s0,sp,48
    1550:	87aa                	mv	a5,a0
    1552:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
    1556:	fdc42783          	lw	a5,-36(s0)
    155a:	0007871b          	sext.w	a4,a5
    155e:	6785                	lui	a5,0x1
    1560:	00f77563          	bgeu	a4,a5,156a <morecore+0x22>
    nu = 4096;
    1564:	6785                	lui	a5,0x1
    1566:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
    156a:	fdc42783          	lw	a5,-36(s0)
    156e:	0047979b          	slliw	a5,a5,0x4
    1572:	2781                	sext.w	a5,a5
    1574:	2781                	sext.w	a5,a5
    1576:	853e                	mv	a0,a5
    1578:	00000097          	auipc	ra,0x0
    157c:	9a0080e7          	jalr	-1632(ra) # f18 <sbrk>
    1580:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
    1584:	fe843703          	ld	a4,-24(s0)
    1588:	57fd                	li	a5,-1
    158a:	00f71463          	bne	a4,a5,1592 <morecore+0x4a>
    return 0;
    158e:	4781                	li	a5,0
    1590:	a03d                	j	15be <morecore+0x76>
  hp = (Header*)p;
    1592:	fe843783          	ld	a5,-24(s0)
    1596:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
    159a:	fe043783          	ld	a5,-32(s0)
    159e:	fdc42703          	lw	a4,-36(s0)
    15a2:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
    15a4:	fe043783          	ld	a5,-32(s0)
    15a8:	07c1                	addi	a5,a5,16
    15aa:	853e                	mv	a0,a5
    15ac:	00000097          	auipc	ra,0x0
    15b0:	e7a080e7          	jalr	-390(ra) # 1426 <free>
  return freep;
    15b4:	00001797          	auipc	a5,0x1
    15b8:	9ac78793          	addi	a5,a5,-1620 # 1f60 <freep>
    15bc:	639c                	ld	a5,0(a5)
}
    15be:	853e                	mv	a0,a5
    15c0:	70a2                	ld	ra,40(sp)
    15c2:	7402                	ld	s0,32(sp)
    15c4:	6145                	addi	sp,sp,48
    15c6:	8082                	ret

00000000000015c8 <malloc>:

void*
malloc(uint nbytes)
{
    15c8:	7139                	addi	sp,sp,-64
    15ca:	fc06                	sd	ra,56(sp)
    15cc:	f822                	sd	s0,48(sp)
    15ce:	0080                	addi	s0,sp,64
    15d0:	87aa                	mv	a5,a0
    15d2:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    15d6:	fcc46783          	lwu	a5,-52(s0)
    15da:	07bd                	addi	a5,a5,15
    15dc:	8391                	srli	a5,a5,0x4
    15de:	2781                	sext.w	a5,a5
    15e0:	2785                	addiw	a5,a5,1
    15e2:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
    15e6:	00001797          	auipc	a5,0x1
    15ea:	97a78793          	addi	a5,a5,-1670 # 1f60 <freep>
    15ee:	639c                	ld	a5,0(a5)
    15f0:	fef43023          	sd	a5,-32(s0)
    15f4:	fe043783          	ld	a5,-32(s0)
    15f8:	ef95                	bnez	a5,1634 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
    15fa:	00001797          	auipc	a5,0x1
    15fe:	95678793          	addi	a5,a5,-1706 # 1f50 <base>
    1602:	fef43023          	sd	a5,-32(s0)
    1606:	00001797          	auipc	a5,0x1
    160a:	95a78793          	addi	a5,a5,-1702 # 1f60 <freep>
    160e:	fe043703          	ld	a4,-32(s0)
    1612:	e398                	sd	a4,0(a5)
    1614:	00001797          	auipc	a5,0x1
    1618:	94c78793          	addi	a5,a5,-1716 # 1f60 <freep>
    161c:	6398                	ld	a4,0(a5)
    161e:	00001797          	auipc	a5,0x1
    1622:	93278793          	addi	a5,a5,-1742 # 1f50 <base>
    1626:	e398                	sd	a4,0(a5)
    base.s.size = 0;
    1628:	00001797          	auipc	a5,0x1
    162c:	92878793          	addi	a5,a5,-1752 # 1f50 <base>
    1630:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1634:	fe043783          	ld	a5,-32(s0)
    1638:	639c                	ld	a5,0(a5)
    163a:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    163e:	fe843783          	ld	a5,-24(s0)
    1642:	4798                	lw	a4,8(a5)
    1644:	fdc42783          	lw	a5,-36(s0)
    1648:	2781                	sext.w	a5,a5
    164a:	06f76863          	bltu	a4,a5,16ba <malloc+0xf2>
      if(p->s.size == nunits)
    164e:	fe843783          	ld	a5,-24(s0)
    1652:	4798                	lw	a4,8(a5)
    1654:	fdc42783          	lw	a5,-36(s0)
    1658:	2781                	sext.w	a5,a5
    165a:	00e79963          	bne	a5,a4,166c <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
    165e:	fe843783          	ld	a5,-24(s0)
    1662:	6398                	ld	a4,0(a5)
    1664:	fe043783          	ld	a5,-32(s0)
    1668:	e398                	sd	a4,0(a5)
    166a:	a82d                	j	16a4 <malloc+0xdc>
      else {
        p->s.size -= nunits;
    166c:	fe843783          	ld	a5,-24(s0)
    1670:	4798                	lw	a4,8(a5)
    1672:	fdc42783          	lw	a5,-36(s0)
    1676:	40f707bb          	subw	a5,a4,a5
    167a:	0007871b          	sext.w	a4,a5
    167e:	fe843783          	ld	a5,-24(s0)
    1682:	c798                	sw	a4,8(a5)
        p += p->s.size;
    1684:	fe843783          	ld	a5,-24(s0)
    1688:	479c                	lw	a5,8(a5)
    168a:	1782                	slli	a5,a5,0x20
    168c:	9381                	srli	a5,a5,0x20
    168e:	0792                	slli	a5,a5,0x4
    1690:	fe843703          	ld	a4,-24(s0)
    1694:	97ba                	add	a5,a5,a4
    1696:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
    169a:	fe843783          	ld	a5,-24(s0)
    169e:	fdc42703          	lw	a4,-36(s0)
    16a2:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
    16a4:	00001797          	auipc	a5,0x1
    16a8:	8bc78793          	addi	a5,a5,-1860 # 1f60 <freep>
    16ac:	fe043703          	ld	a4,-32(s0)
    16b0:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
    16b2:	fe843783          	ld	a5,-24(s0)
    16b6:	07c1                	addi	a5,a5,16
    16b8:	a091                	j	16fc <malloc+0x134>
    }
    if(p == freep)
    16ba:	00001797          	auipc	a5,0x1
    16be:	8a678793          	addi	a5,a5,-1882 # 1f60 <freep>
    16c2:	639c                	ld	a5,0(a5)
    16c4:	fe843703          	ld	a4,-24(s0)
    16c8:	02f71063          	bne	a4,a5,16e8 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
    16cc:	fdc42783          	lw	a5,-36(s0)
    16d0:	853e                	mv	a0,a5
    16d2:	00000097          	auipc	ra,0x0
    16d6:	e76080e7          	jalr	-394(ra) # 1548 <morecore>
    16da:	fea43423          	sd	a0,-24(s0)
    16de:	fe843783          	ld	a5,-24(s0)
    16e2:	e399                	bnez	a5,16e8 <malloc+0x120>
        return 0;
    16e4:	4781                	li	a5,0
    16e6:	a819                	j	16fc <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16e8:	fe843783          	ld	a5,-24(s0)
    16ec:	fef43023          	sd	a5,-32(s0)
    16f0:	fe843783          	ld	a5,-24(s0)
    16f4:	639c                	ld	a5,0(a5)
    16f6:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    16fa:	b791                	j	163e <malloc+0x76>
  }
}
    16fc:	853e                	mv	a0,a5
    16fe:	70e2                	ld	ra,56(sp)
    1700:	7442                	ld	s0,48(sp)
    1702:	6121                	addi	sp,sp,64
    1704:	8082                	ret

0000000000001706 <setjmp>:
    1706:	e100                	sd	s0,0(a0)
    1708:	e504                	sd	s1,8(a0)
    170a:	01253823          	sd	s2,16(a0)
    170e:	01353c23          	sd	s3,24(a0)
    1712:	03453023          	sd	s4,32(a0)
    1716:	03553423          	sd	s5,40(a0)
    171a:	03653823          	sd	s6,48(a0)
    171e:	03753c23          	sd	s7,56(a0)
    1722:	05853023          	sd	s8,64(a0)
    1726:	05953423          	sd	s9,72(a0)
    172a:	05a53823          	sd	s10,80(a0)
    172e:	05b53c23          	sd	s11,88(a0)
    1732:	06153023          	sd	ra,96(a0)
    1736:	06253423          	sd	sp,104(a0)
    173a:	4501                	li	a0,0
    173c:	8082                	ret

000000000000173e <longjmp>:
    173e:	6100                	ld	s0,0(a0)
    1740:	6504                	ld	s1,8(a0)
    1742:	01053903          	ld	s2,16(a0)
    1746:	01853983          	ld	s3,24(a0)
    174a:	02053a03          	ld	s4,32(a0)
    174e:	02853a83          	ld	s5,40(a0)
    1752:	03053b03          	ld	s6,48(a0)
    1756:	03853b83          	ld	s7,56(a0)
    175a:	04053c03          	ld	s8,64(a0)
    175e:	04853c83          	ld	s9,72(a0)
    1762:	05053d03          	ld	s10,80(a0)
    1766:	05853d83          	ld	s11,88(a0)
    176a:	06053083          	ld	ra,96(a0)
    176e:	06853103          	ld	sp,104(a0)
    1772:	c199                	beqz	a1,1778 <longjmp_1>
    1774:	852e                	mv	a0,a1
    1776:	8082                	ret

0000000000001778 <longjmp_1>:
    1778:	4505                	li	a0,1
    177a:	8082                	ret

000000000000177c <schedule_default>:

#define NULL 0

/* default scheduling algorithm */
struct threads_sched_result schedule_default(struct threads_sched_args args)
{
    177c:	715d                	addi	sp,sp,-80
    177e:	e4a2                	sd	s0,72(sp)
    1780:	e0a6                	sd	s1,64(sp)
    1782:	0880                	addi	s0,sp,80
    1784:	84aa                	mv	s1,a0
    struct thread *thread_with_smallest_id = NULL;
    1786:	fe043423          	sd	zero,-24(s0)
    struct thread *th = NULL;
    178a:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    178e:	649c                	ld	a5,8(s1)
    1790:	639c                	ld	a5,0(a5)
    1792:	fcf43c23          	sd	a5,-40(s0)
    1796:	fd843783          	ld	a5,-40(s0)
    179a:	fd878793          	addi	a5,a5,-40
    179e:	fef43023          	sd	a5,-32(s0)
    17a2:	a81d                	j	17d8 <schedule_default+0x5c>
        if (thread_with_smallest_id == NULL || th->ID < thread_with_smallest_id->ID) {
    17a4:	fe843783          	ld	a5,-24(s0)
    17a8:	cb89                	beqz	a5,17ba <schedule_default+0x3e>
    17aa:	fe043783          	ld	a5,-32(s0)
    17ae:	5398                	lw	a4,32(a5)
    17b0:	fe843783          	ld	a5,-24(s0)
    17b4:	539c                	lw	a5,32(a5)
    17b6:	00f75663          	bge	a4,a5,17c2 <schedule_default+0x46>
            thread_with_smallest_id = th;
    17ba:	fe043783          	ld	a5,-32(s0)
    17be:	fef43423          	sd	a5,-24(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    17c2:	fe043783          	ld	a5,-32(s0)
    17c6:	779c                	ld	a5,40(a5)
    17c8:	fcf43823          	sd	a5,-48(s0)
    17cc:	fd043783          	ld	a5,-48(s0)
    17d0:	fd878793          	addi	a5,a5,-40
    17d4:	fef43023          	sd	a5,-32(s0)
    17d8:	fe043783          	ld	a5,-32(s0)
    17dc:	02878713          	addi	a4,a5,40
    17e0:	649c                	ld	a5,8(s1)
    17e2:	fcf711e3          	bne	a4,a5,17a4 <schedule_default+0x28>
        }
    }

    struct threads_sched_result r;
    if (thread_with_smallest_id != NULL) {
    17e6:	fe843783          	ld	a5,-24(s0)
    17ea:	cf89                	beqz	a5,1804 <schedule_default+0x88>
        r.scheduled_thread_list_member = &thread_with_smallest_id->thread_list;
    17ec:	fe843783          	ld	a5,-24(s0)
    17f0:	02878793          	addi	a5,a5,40
    17f4:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = thread_with_smallest_id->remaining_time;
    17f8:	fe843783          	ld	a5,-24(s0)
    17fc:	47fc                	lw	a5,76(a5)
    17fe:	faf42c23          	sw	a5,-72(s0)
    1802:	a039                	j	1810 <schedule_default+0x94>
    } else {
        r.scheduled_thread_list_member = args.run_queue;
    1804:	649c                	ld	a5,8(s1)
    1806:	faf43823          	sd	a5,-80(s0)
        r.allocated_time = 1;
    180a:	4785                	li	a5,1
    180c:	faf42c23          	sw	a5,-72(s0)
    }

    return r;
    1810:	fb043783          	ld	a5,-80(s0)
    1814:	fcf43023          	sd	a5,-64(s0)
    1818:	fb843783          	ld	a5,-72(s0)
    181c:	fcf43423          	sd	a5,-56(s0)
    1820:	fc043703          	ld	a4,-64(s0)
    1824:	fc843783          	ld	a5,-56(s0)
    1828:	863a                	mv	a2,a4
    182a:	86be                	mv	a3,a5
    182c:	8732                	mv	a4,a2
    182e:	87b6                	mv	a5,a3

}
    1830:	853a                	mv	a0,a4
    1832:	85be                	mv	a1,a5
    1834:	6426                	ld	s0,72(sp)
    1836:	6486                	ld	s1,64(sp)
    1838:	6161                	addi	sp,sp,80
    183a:	8082                	ret

000000000000183c <schedule_edf>:

/* Earliest-Deadline-First scheduling */
struct threads_sched_result schedule_edf(struct threads_sched_args args)
{   
    183c:	7171                	addi	sp,sp,-176
    183e:	f522                	sd	s0,168(sp)
    1840:	f126                	sd	s1,160(sp)
    1842:	1900                	addi	s0,sp,176
    1844:	84aa                	mv	s1,a0
    int is_miss = 0;
    1846:	fe042623          	sw	zero,-20(s0)
    struct thread *tws_deadline = NULL, *tws_id = NULL;
    184a:	fe043023          	sd	zero,-32(s0)
    184e:	fc043c23          	sd	zero,-40(s0)
    struct thread *th = NULL;
    1852:	fc043823          	sd	zero,-48(s0)
    
    list_for_each_entry(th, args.run_queue, thread_list) {
    1856:	649c                	ld	a5,8(s1)
    1858:	639c                	ld	a5,0(a5)
    185a:	faf43423          	sd	a5,-88(s0)
    185e:	fa843783          	ld	a5,-88(s0)
    1862:	fd878793          	addi	a5,a5,-40
    1866:	fcf43823          	sd	a5,-48(s0)
    186a:	a895                	j	18de <schedule_edf+0xa2>
        if(args.current_time + th->remaining_time > th->current_deadline){
    186c:	4098                	lw	a4,0(s1)
    186e:	fd043783          	ld	a5,-48(s0)
    1872:	47fc                	lw	a5,76(a5)
    1874:	9fb9                	addw	a5,a5,a4
    1876:	0007871b          	sext.w	a4,a5
    187a:	fd043783          	ld	a5,-48(s0)
    187e:	4bbc                	lw	a5,80(a5)
    1880:	00e7d563          	bge	a5,a4,188a <schedule_edf+0x4e>
            is_miss = 1;
    1884:	4785                	li	a5,1
    1886:	fef42623          	sw	a5,-20(s0)
        }
        if (tws_deadline == NULL || (th->current_deadline < tws_deadline->current_deadline) || (th->current_deadline == tws_deadline->current_deadline && th->ID < tws_deadline->ID)) {
    188a:	fe043783          	ld	a5,-32(s0)
    188e:	cb8d                	beqz	a5,18c0 <schedule_edf+0x84>
    1890:	fd043783          	ld	a5,-48(s0)
    1894:	4bb8                	lw	a4,80(a5)
    1896:	fe043783          	ld	a5,-32(s0)
    189a:	4bbc                	lw	a5,80(a5)
    189c:	02f74263          	blt	a4,a5,18c0 <schedule_edf+0x84>
    18a0:	fd043783          	ld	a5,-48(s0)
    18a4:	4bb8                	lw	a4,80(a5)
    18a6:	fe043783          	ld	a5,-32(s0)
    18aa:	4bbc                	lw	a5,80(a5)
    18ac:	00f71e63          	bne	a4,a5,18c8 <schedule_edf+0x8c>
    18b0:	fd043783          	ld	a5,-48(s0)
    18b4:	5398                	lw	a4,32(a5)
    18b6:	fe043783          	ld	a5,-32(s0)
    18ba:	539c                	lw	a5,32(a5)
    18bc:	00f75663          	bge	a4,a5,18c8 <schedule_edf+0x8c>
            tws_deadline = th;
    18c0:	fd043783          	ld	a5,-48(s0)
    18c4:	fef43023          	sd	a5,-32(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    18c8:	fd043783          	ld	a5,-48(s0)
    18cc:	779c                	ld	a5,40(a5)
    18ce:	f6f43823          	sd	a5,-144(s0)
    18d2:	f7043783          	ld	a5,-144(s0)
    18d6:	fd878793          	addi	a5,a5,-40
    18da:	fcf43823          	sd	a5,-48(s0)
    18de:	fd043783          	ld	a5,-48(s0)
    18e2:	02878713          	addi	a4,a5,40
    18e6:	649c                	ld	a5,8(s1)
    18e8:	f8f712e3          	bne	a4,a5,186c <schedule_edf+0x30>
        }
    }
    
    struct threads_sched_result r;
    if (tws_deadline != NULL) {
    18ec:	fe043783          	ld	a5,-32(s0)
    18f0:	18078063          	beqz	a5,1a70 <schedule_edf+0x234>
        if(!is_miss){
    18f4:	fec42783          	lw	a5,-20(s0)
    18f8:	2781                	sext.w	a5,a5
    18fa:	e3ed                	bnez	a5,19dc <schedule_edf+0x1a0>
            r.scheduled_thread_list_member = &tws_deadline->thread_list;
    18fc:	fe043783          	ld	a5,-32(s0)
    1900:	02878793          	addi	a5,a5,40
    1904:	f4f43823          	sd	a5,-176(s0)
            struct release_queue_entry *rth;
            struct thread *find = NULL;
    1908:	fc043023          	sd	zero,-64(s0)
            list_for_each_entry(rth, args.release_queue, thread_list){
    190c:	689c                	ld	a5,16(s1)
    190e:	639c                	ld	a5,0(a5)
    1910:	f8f43023          	sd	a5,-128(s0)
    1914:	f8043783          	ld	a5,-128(s0)
    1918:	17e1                	addi	a5,a5,-8
    191a:	fcf43423          	sd	a5,-56(s0)
    191e:	a88d                	j	1990 <schedule_edf+0x154>
                if (rth->thrd->current_deadline + rth->thrd->period < tws_deadline->current_deadline && (find == NULL || rth->thrd->current_deadline + rth->thrd->period < find->current_deadline + find->period)) {
    1920:	fc843783          	ld	a5,-56(s0)
    1924:	639c                	ld	a5,0(a5)
    1926:	4bb8                	lw	a4,80(a5)
    1928:	fc843783          	ld	a5,-56(s0)
    192c:	639c                	ld	a5,0(a5)
    192e:	43fc                	lw	a5,68(a5)
    1930:	9fb9                	addw	a5,a5,a4
    1932:	0007871b          	sext.w	a4,a5
    1936:	fe043783          	ld	a5,-32(s0)
    193a:	4bbc                	lw	a5,80(a5)
    193c:	04f75063          	bge	a4,a5,197c <schedule_edf+0x140>
    1940:	fc043783          	ld	a5,-64(s0)
    1944:	c79d                	beqz	a5,1972 <schedule_edf+0x136>
    1946:	fc843783          	ld	a5,-56(s0)
    194a:	639c                	ld	a5,0(a5)
    194c:	4bb8                	lw	a4,80(a5)
    194e:	fc843783          	ld	a5,-56(s0)
    1952:	639c                	ld	a5,0(a5)
    1954:	43fc                	lw	a5,68(a5)
    1956:	9fb9                	addw	a5,a5,a4
    1958:	0007859b          	sext.w	a1,a5
    195c:	fc043783          	ld	a5,-64(s0)
    1960:	4bb8                	lw	a4,80(a5)
    1962:	fc043783          	ld	a5,-64(s0)
    1966:	43fc                	lw	a5,68(a5)
    1968:	9fb9                	addw	a5,a5,a4
    196a:	2781                	sext.w	a5,a5
    196c:	872e                	mv	a4,a1
    196e:	00f75763          	bge	a4,a5,197c <schedule_edf+0x140>
                    find = rth->thrd;
    1972:	fc843783          	ld	a5,-56(s0)
    1976:	639c                	ld	a5,0(a5)
    1978:	fcf43023          	sd	a5,-64(s0)
            list_for_each_entry(rth, args.release_queue, thread_list){
    197c:	fc843783          	ld	a5,-56(s0)
    1980:	679c                	ld	a5,8(a5)
    1982:	f6f43c23          	sd	a5,-136(s0)
    1986:	f7843783          	ld	a5,-136(s0)
    198a:	17e1                	addi	a5,a5,-8
    198c:	fcf43423          	sd	a5,-56(s0)
    1990:	fc843783          	ld	a5,-56(s0)
    1994:	00878713          	addi	a4,a5,8
    1998:	689c                	ld	a5,16(s1)
    199a:	f8f713e3          	bne	a4,a5,1920 <schedule_edf+0xe4>
                }
            }
            if(find == NULL || args.current_time + tws_deadline->remaining_time <= find->current_deadline) r.allocated_time = tws_deadline->remaining_time;
    199e:	fc043783          	ld	a5,-64(s0)
    19a2:	cf89                	beqz	a5,19bc <schedule_edf+0x180>
    19a4:	4098                	lw	a4,0(s1)
    19a6:	fe043783          	ld	a5,-32(s0)
    19aa:	47fc                	lw	a5,76(a5)
    19ac:	9fb9                	addw	a5,a5,a4
    19ae:	0007871b          	sext.w	a4,a5
    19b2:	fc043783          	ld	a5,-64(s0)
    19b6:	4bbc                	lw	a5,80(a5)
    19b8:	00e7c863          	blt	a5,a4,19c8 <schedule_edf+0x18c>
    19bc:	fe043783          	ld	a5,-32(s0)
    19c0:	47fc                	lw	a5,76(a5)
    19c2:	f4f42c23          	sw	a5,-168(s0)
    19c6:	aa39                	j	1ae4 <schedule_edf+0x2a8>
            else{
                //r.allocated_time = tws_deadline->remaining_time;
                r.allocated_time = find->current_deadline - args.current_time;
    19c8:	fc043783          	ld	a5,-64(s0)
    19cc:	4bb8                	lw	a4,80(a5)
    19ce:	409c                	lw	a5,0(s1)
    19d0:	40f707bb          	subw	a5,a4,a5
    19d4:	2781                	sext.w	a5,a5
    19d6:	f4f42c23          	sw	a5,-168(s0)
    19da:	a229                	j	1ae4 <schedule_edf+0x2a8>
            }
        }
        else{
            list_for_each_entry(th, args.run_queue, thread_list) {
    19dc:	649c                	ld	a5,8(s1)
    19de:	639c                	ld	a5,0(a5)
    19e0:	f8f43823          	sd	a5,-112(s0)
    19e4:	f9043783          	ld	a5,-112(s0)
    19e8:	fd878793          	addi	a5,a5,-40
    19ec:	fcf43823          	sd	a5,-48(s0)
    19f0:	a089                	j	1a32 <schedule_edf+0x1f6>
                if (tws_id == NULL || (args.current_time >= th->current_deadline && th->ID < tws_id->ID)) {
    19f2:	fd843783          	ld	a5,-40(s0)
    19f6:	cf99                	beqz	a5,1a14 <schedule_edf+0x1d8>
    19f8:	4098                	lw	a4,0(s1)
    19fa:	fd043783          	ld	a5,-48(s0)
    19fe:	4bbc                	lw	a5,80(a5)
    1a00:	00f74e63          	blt	a4,a5,1a1c <schedule_edf+0x1e0>
    1a04:	fd043783          	ld	a5,-48(s0)
    1a08:	5398                	lw	a4,32(a5)
    1a0a:	fd843783          	ld	a5,-40(s0)
    1a0e:	539c                	lw	a5,32(a5)
    1a10:	00f75663          	bge	a4,a5,1a1c <schedule_edf+0x1e0>
                    tws_id = th;
    1a14:	fd043783          	ld	a5,-48(s0)
    1a18:	fcf43c23          	sd	a5,-40(s0)
            list_for_each_entry(th, args.run_queue, thread_list) {
    1a1c:	fd043783          	ld	a5,-48(s0)
    1a20:	779c                	ld	a5,40(a5)
    1a22:	f8f43423          	sd	a5,-120(s0)
    1a26:	f8843783          	ld	a5,-120(s0)
    1a2a:	fd878793          	addi	a5,a5,-40
    1a2e:	fcf43823          	sd	a5,-48(s0)
    1a32:	fd043783          	ld	a5,-48(s0)
    1a36:	02878713          	addi	a4,a5,40
    1a3a:	649c                	ld	a5,8(s1)
    1a3c:	faf71be3          	bne	a4,a5,19f2 <schedule_edf+0x1b6>
                }
            }
            r.scheduled_thread_list_member = &tws_id->thread_list;
    1a40:	fd843783          	ld	a5,-40(s0)
    1a44:	02878793          	addi	a5,a5,40
    1a48:	f4f43823          	sd	a5,-176(s0)
            r.allocated_time = (tws_id->current_deadline - args.current_time < 0)? 0: tws_id->current_deadline - args.current_time;
    1a4c:	fd843783          	ld	a5,-40(s0)
    1a50:	4bb8                	lw	a4,80(a5)
    1a52:	409c                	lw	a5,0(s1)
    1a54:	40f707bb          	subw	a5,a4,a5
    1a58:	2781                	sext.w	a5,a5
    1a5a:	873e                	mv	a4,a5
    1a5c:	0007079b          	sext.w	a5,a4
    1a60:	0007d363          	bgez	a5,1a66 <schedule_edf+0x22a>
    1a64:	4701                	li	a4,0
    1a66:	0007079b          	sext.w	a5,a4
    1a6a:	f4f42c23          	sw	a5,-168(s0)
    1a6e:	a89d                	j	1ae4 <schedule_edf+0x2a8>
        }
        
    } else {
        r.scheduled_thread_list_member = args.run_queue;
    1a70:	649c                	ld	a5,8(s1)
    1a72:	f4f43823          	sd	a5,-176(s0)
            struct release_queue_entry *rth;
            struct thread *find = NULL;
    1a76:	fa043823          	sd	zero,-80(s0)
            list_for_each_entry(rth, args.release_queue, thread_list) {
    1a7a:	689c                	ld	a5,16(s1)
    1a7c:	639c                	ld	a5,0(a5)
    1a7e:	faf43023          	sd	a5,-96(s0)
    1a82:	fa043783          	ld	a5,-96(s0)
    1a86:	17e1                	addi	a5,a5,-8
    1a88:	faf43c23          	sd	a5,-72(s0)
    1a8c:	a825                	j	1ac4 <schedule_edf+0x288>
            if (find == NULL || (rth->thrd->current_deadline < find->current_deadline)) {
    1a8e:	fb043783          	ld	a5,-80(s0)
    1a92:	cb91                	beqz	a5,1aa6 <schedule_edf+0x26a>
    1a94:	fb843783          	ld	a5,-72(s0)
    1a98:	639c                	ld	a5,0(a5)
    1a9a:	4bb8                	lw	a4,80(a5)
    1a9c:	fb043783          	ld	a5,-80(s0)
    1aa0:	4bbc                	lw	a5,80(a5)
    1aa2:	00f75763          	bge	a4,a5,1ab0 <schedule_edf+0x274>
                find = rth->thrd;
    1aa6:	fb843783          	ld	a5,-72(s0)
    1aaa:	639c                	ld	a5,0(a5)
    1aac:	faf43823          	sd	a5,-80(s0)
            list_for_each_entry(rth, args.release_queue, thread_list) {
    1ab0:	fb843783          	ld	a5,-72(s0)
    1ab4:	679c                	ld	a5,8(a5)
    1ab6:	f8f43c23          	sd	a5,-104(s0)
    1aba:	f9843783          	ld	a5,-104(s0)
    1abe:	17e1                	addi	a5,a5,-8
    1ac0:	faf43c23          	sd	a5,-72(s0)
    1ac4:	fb843783          	ld	a5,-72(s0)
    1ac8:	00878713          	addi	a4,a5,8
    1acc:	689c                	ld	a5,16(s1)
    1ace:	fcf710e3          	bne	a4,a5,1a8e <schedule_edf+0x252>
            }
        }
        r.allocated_time = find->current_deadline - args.current_time;
    1ad2:	fb043783          	ld	a5,-80(s0)
    1ad6:	4bb8                	lw	a4,80(a5)
    1ad8:	409c                	lw	a5,0(s1)
    1ada:	40f707bb          	subw	a5,a4,a5
    1ade:	2781                	sext.w	a5,a5
    1ae0:	f4f42c23          	sw	a5,-168(s0)
    }

    return r;
    1ae4:	f5043783          	ld	a5,-176(s0)
    1ae8:	f6f43023          	sd	a5,-160(s0)
    1aec:	f5843783          	ld	a5,-168(s0)
    1af0:	f6f43423          	sd	a5,-152(s0)
    1af4:	f6043703          	ld	a4,-160(s0)
    1af8:	f6843783          	ld	a5,-152(s0)
    1afc:	863a                	mv	a2,a4
    1afe:	86be                	mv	a3,a5
    1b00:	8732                	mv	a4,a2
    1b02:	87b6                	mv	a5,a3
}
    1b04:	853a                	mv	a0,a4
    1b06:	85be                	mv	a1,a5
    1b08:	742a                	ld	s0,168(sp)
    1b0a:	748a                	ld	s1,160(sp)
    1b0c:	614d                	addi	sp,sp,176
    1b0e:	8082                	ret

0000000000001b10 <schedule_rm>:

/* Rate-Monotonic Scheduling */
struct threads_sched_result schedule_rm(struct threads_sched_args args)
{
    1b10:	7171                	addi	sp,sp,-176
    1b12:	f522                	sd	s0,168(sp)
    1b14:	f126                	sd	s1,160(sp)
    1b16:	1900                	addi	s0,sp,176
    1b18:	84aa                	mv	s1,a0
    int is_miss = 0;
    1b1a:	fe042623          	sw	zero,-20(s0)
    struct thread *tws_period = NULL, *tws_id = NULL;
    1b1e:	fe043023          	sd	zero,-32(s0)
    1b22:	fc043c23          	sd	zero,-40(s0)
    struct thread *th = NULL;
    1b26:	fc043823          	sd	zero,-48(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1b2a:	649c                	ld	a5,8(s1)
    1b2c:	639c                	ld	a5,0(a5)
    1b2e:	faf43423          	sd	a5,-88(s0)
    1b32:	fa843783          	ld	a5,-88(s0)
    1b36:	fd878793          	addi	a5,a5,-40
    1b3a:	fcf43823          	sd	a5,-48(s0)
    1b3e:	a895                	j	1bb2 <schedule_rm+0xa2>
        if(args.current_time + th->remaining_time > th->current_deadline){
    1b40:	4098                	lw	a4,0(s1)
    1b42:	fd043783          	ld	a5,-48(s0)
    1b46:	47fc                	lw	a5,76(a5)
    1b48:	9fb9                	addw	a5,a5,a4
    1b4a:	0007871b          	sext.w	a4,a5
    1b4e:	fd043783          	ld	a5,-48(s0)
    1b52:	4bbc                	lw	a5,80(a5)
    1b54:	00e7d563          	bge	a5,a4,1b5e <schedule_rm+0x4e>
            is_miss = 1;
    1b58:	4785                	li	a5,1
    1b5a:	fef42623          	sw	a5,-20(s0)
            //break;
        }
        if (tws_period == NULL || (th->period < tws_period->period) || (th->period == tws_period->period && th->ID < tws_period->ID)) {
    1b5e:	fe043783          	ld	a5,-32(s0)
    1b62:	cb8d                	beqz	a5,1b94 <schedule_rm+0x84>
    1b64:	fd043783          	ld	a5,-48(s0)
    1b68:	43f8                	lw	a4,68(a5)
    1b6a:	fe043783          	ld	a5,-32(s0)
    1b6e:	43fc                	lw	a5,68(a5)
    1b70:	02f74263          	blt	a4,a5,1b94 <schedule_rm+0x84>
    1b74:	fd043783          	ld	a5,-48(s0)
    1b78:	43f8                	lw	a4,68(a5)
    1b7a:	fe043783          	ld	a5,-32(s0)
    1b7e:	43fc                	lw	a5,68(a5)
    1b80:	00f71e63          	bne	a4,a5,1b9c <schedule_rm+0x8c>
    1b84:	fd043783          	ld	a5,-48(s0)
    1b88:	5398                	lw	a4,32(a5)
    1b8a:	fe043783          	ld	a5,-32(s0)
    1b8e:	539c                	lw	a5,32(a5)
    1b90:	00f75663          	bge	a4,a5,1b9c <schedule_rm+0x8c>
            tws_period = th;
    1b94:	fd043783          	ld	a5,-48(s0)
    1b98:	fef43023          	sd	a5,-32(s0)
    list_for_each_entry(th, args.run_queue, thread_list) {
    1b9c:	fd043783          	ld	a5,-48(s0)
    1ba0:	779c                	ld	a5,40(a5)
    1ba2:	f6f43823          	sd	a5,-144(s0)
    1ba6:	f7043783          	ld	a5,-144(s0)
    1baa:	fd878793          	addi	a5,a5,-40
    1bae:	fcf43823          	sd	a5,-48(s0)
    1bb2:	fd043783          	ld	a5,-48(s0)
    1bb6:	02878713          	addi	a4,a5,40
    1bba:	649c                	ld	a5,8(s1)
    1bbc:	f8f712e3          	bne	a4,a5,1b40 <schedule_rm+0x30>
        }
    }

    struct threads_sched_result r; 
    if (tws_period != NULL) {
    1bc0:	fe043783          	ld	a5,-32(s0)
    1bc4:	16078063          	beqz	a5,1d24 <schedule_rm+0x214>
        if(!is_miss){
    1bc8:	fec42783          	lw	a5,-20(s0)
    1bcc:	2781                	sext.w	a5,a5
    1bce:	e3e9                	bnez	a5,1c90 <schedule_rm+0x180>
            r.scheduled_thread_list_member = &tws_period->thread_list;
    1bd0:	fe043783          	ld	a5,-32(s0)
    1bd4:	02878793          	addi	a5,a5,40
    1bd8:	f4f43823          	sd	a5,-176(s0)
            struct release_queue_entry *rth;
            struct thread *find = NULL;
    1bdc:	fc043023          	sd	zero,-64(s0)
            list_for_each_entry(rth, args.release_queue, thread_list){
    1be0:	689c                	ld	a5,16(s1)
    1be2:	639c                	ld	a5,0(a5)
    1be4:	f8f43023          	sd	a5,-128(s0)
    1be8:	f8043783          	ld	a5,-128(s0)
    1bec:	17e1                	addi	a5,a5,-8
    1bee:	fcf43423          	sd	a5,-56(s0)
    1bf2:	a889                	j	1c44 <schedule_rm+0x134>
                if(find == NULL || rth->thrd->current_deadline + rth->thrd->period < find->current_deadline + find->period) {
    1bf4:	fc043783          	ld	a5,-64(s0)
    1bf8:	c79d                	beqz	a5,1c26 <schedule_rm+0x116>
    1bfa:	fc843783          	ld	a5,-56(s0)
    1bfe:	639c                	ld	a5,0(a5)
    1c00:	4bb8                	lw	a4,80(a5)
    1c02:	fc843783          	ld	a5,-56(s0)
    1c06:	639c                	ld	a5,0(a5)
    1c08:	43fc                	lw	a5,68(a5)
    1c0a:	9fb9                	addw	a5,a5,a4
    1c0c:	0007859b          	sext.w	a1,a5
    1c10:	fc043783          	ld	a5,-64(s0)
    1c14:	4bb8                	lw	a4,80(a5)
    1c16:	fc043783          	ld	a5,-64(s0)
    1c1a:	43fc                	lw	a5,68(a5)
    1c1c:	9fb9                	addw	a5,a5,a4
    1c1e:	2781                	sext.w	a5,a5
    1c20:	872e                	mv	a4,a1
    1c22:	00f75763          	bge	a4,a5,1c30 <schedule_rm+0x120>
                    find = rth->thrd;
    1c26:	fc843783          	ld	a5,-56(s0)
    1c2a:	639c                	ld	a5,0(a5)
    1c2c:	fcf43023          	sd	a5,-64(s0)
            list_for_each_entry(rth, args.release_queue, thread_list){
    1c30:	fc843783          	ld	a5,-56(s0)
    1c34:	679c                	ld	a5,8(a5)
    1c36:	f6f43c23          	sd	a5,-136(s0)
    1c3a:	f7843783          	ld	a5,-136(s0)
    1c3e:	17e1                	addi	a5,a5,-8
    1c40:	fcf43423          	sd	a5,-56(s0)
    1c44:	fc843783          	ld	a5,-56(s0)
    1c48:	00878713          	addi	a4,a5,8
    1c4c:	689c                	ld	a5,16(s1)
    1c4e:	faf713e3          	bne	a4,a5,1bf4 <schedule_rm+0xe4>
                }
            }
            if(find == NULL || args.current_time + tws_period->remaining_time <= find->current_deadline) r.allocated_time = tws_period->remaining_time;
    1c52:	fc043783          	ld	a5,-64(s0)
    1c56:	cf89                	beqz	a5,1c70 <schedule_rm+0x160>
    1c58:	4098                	lw	a4,0(s1)
    1c5a:	fe043783          	ld	a5,-32(s0)
    1c5e:	47fc                	lw	a5,76(a5)
    1c60:	9fb9                	addw	a5,a5,a4
    1c62:	0007871b          	sext.w	a4,a5
    1c66:	fc043783          	ld	a5,-64(s0)
    1c6a:	4bbc                	lw	a5,80(a5)
    1c6c:	00e7c863          	blt	a5,a4,1c7c <schedule_rm+0x16c>
    1c70:	fe043783          	ld	a5,-32(s0)
    1c74:	47fc                	lw	a5,76(a5)
    1c76:	f4f42c23          	sw	a5,-168(s0)
    1c7a:	aa39                	j	1d98 <schedule_rm+0x288>
            else{
                //r.allocated_time = tws_period->remaining_time;
                r.allocated_time = find->current_deadline - args.current_time;
    1c7c:	fc043783          	ld	a5,-64(s0)
    1c80:	4bb8                	lw	a4,80(a5)
    1c82:	409c                	lw	a5,0(s1)
    1c84:	40f707bb          	subw	a5,a4,a5
    1c88:	2781                	sext.w	a5,a5
    1c8a:	f4f42c23          	sw	a5,-168(s0)
    1c8e:	a229                	j	1d98 <schedule_rm+0x288>
            }
        }
        else{
            list_for_each_entry(th, args.run_queue, thread_list) {
    1c90:	649c                	ld	a5,8(s1)
    1c92:	639c                	ld	a5,0(a5)
    1c94:	f8f43823          	sd	a5,-112(s0)
    1c98:	f9043783          	ld	a5,-112(s0)
    1c9c:	fd878793          	addi	a5,a5,-40
    1ca0:	fcf43823          	sd	a5,-48(s0)
    1ca4:	a089                	j	1ce6 <schedule_rm+0x1d6>
                if (tws_id == NULL || (args.current_time >= th->current_deadline && th->ID < tws_id->ID)) {
    1ca6:	fd843783          	ld	a5,-40(s0)
    1caa:	cf99                	beqz	a5,1cc8 <schedule_rm+0x1b8>
    1cac:	4098                	lw	a4,0(s1)
    1cae:	fd043783          	ld	a5,-48(s0)
    1cb2:	4bbc                	lw	a5,80(a5)
    1cb4:	00f74e63          	blt	a4,a5,1cd0 <schedule_rm+0x1c0>
    1cb8:	fd043783          	ld	a5,-48(s0)
    1cbc:	5398                	lw	a4,32(a5)
    1cbe:	fd843783          	ld	a5,-40(s0)
    1cc2:	539c                	lw	a5,32(a5)
    1cc4:	00f75663          	bge	a4,a5,1cd0 <schedule_rm+0x1c0>
                    tws_id = th;
    1cc8:	fd043783          	ld	a5,-48(s0)
    1ccc:	fcf43c23          	sd	a5,-40(s0)
            list_for_each_entry(th, args.run_queue, thread_list) {
    1cd0:	fd043783          	ld	a5,-48(s0)
    1cd4:	779c                	ld	a5,40(a5)
    1cd6:	f8f43423          	sd	a5,-120(s0)
    1cda:	f8843783          	ld	a5,-120(s0)
    1cde:	fd878793          	addi	a5,a5,-40
    1ce2:	fcf43823          	sd	a5,-48(s0)
    1ce6:	fd043783          	ld	a5,-48(s0)
    1cea:	02878713          	addi	a4,a5,40
    1cee:	649c                	ld	a5,8(s1)
    1cf0:	faf71be3          	bne	a4,a5,1ca6 <schedule_rm+0x196>
                }
            }
            r.scheduled_thread_list_member = &tws_id->thread_list;
    1cf4:	fd843783          	ld	a5,-40(s0)
    1cf8:	02878793          	addi	a5,a5,40
    1cfc:	f4f43823          	sd	a5,-176(s0)
            r.allocated_time = (tws_id->current_deadline - args.current_time < 0)? 0: tws_id->current_deadline - args.current_time;
    1d00:	fd843783          	ld	a5,-40(s0)
    1d04:	4bb8                	lw	a4,80(a5)
    1d06:	409c                	lw	a5,0(s1)
    1d08:	40f707bb          	subw	a5,a4,a5
    1d0c:	2781                	sext.w	a5,a5
    1d0e:	873e                	mv	a4,a5
    1d10:	0007079b          	sext.w	a5,a4
    1d14:	0007d363          	bgez	a5,1d1a <schedule_rm+0x20a>
    1d18:	4701                	li	a4,0
    1d1a:	0007079b          	sext.w	a5,a4
    1d1e:	f4f42c23          	sw	a5,-168(s0)
    1d22:	a89d                	j	1d98 <schedule_rm+0x288>
        }
    } else {
        r.scheduled_thread_list_member = args.run_queue;
    1d24:	649c                	ld	a5,8(s1)
    1d26:	f4f43823          	sd	a5,-176(s0)
            struct release_queue_entry *rth;
            struct thread *find = NULL;
    1d2a:	fa043823          	sd	zero,-80(s0)
            list_for_each_entry(rth, args.release_queue, thread_list) {
    1d2e:	689c                	ld	a5,16(s1)
    1d30:	639c                	ld	a5,0(a5)
    1d32:	faf43023          	sd	a5,-96(s0)
    1d36:	fa043783          	ld	a5,-96(s0)
    1d3a:	17e1                	addi	a5,a5,-8
    1d3c:	faf43c23          	sd	a5,-72(s0)
    1d40:	a825                	j	1d78 <schedule_rm+0x268>
            if (find == NULL || (rth->thrd->period < find->period)) {
    1d42:	fb043783          	ld	a5,-80(s0)
    1d46:	cb91                	beqz	a5,1d5a <schedule_rm+0x24a>
    1d48:	fb843783          	ld	a5,-72(s0)
    1d4c:	639c                	ld	a5,0(a5)
    1d4e:	43f8                	lw	a4,68(a5)
    1d50:	fb043783          	ld	a5,-80(s0)
    1d54:	43fc                	lw	a5,68(a5)
    1d56:	00f75763          	bge	a4,a5,1d64 <schedule_rm+0x254>
                find = rth->thrd;
    1d5a:	fb843783          	ld	a5,-72(s0)
    1d5e:	639c                	ld	a5,0(a5)
    1d60:	faf43823          	sd	a5,-80(s0)
            list_for_each_entry(rth, args.release_queue, thread_list) {
    1d64:	fb843783          	ld	a5,-72(s0)
    1d68:	679c                	ld	a5,8(a5)
    1d6a:	f8f43c23          	sd	a5,-104(s0)
    1d6e:	f9843783          	ld	a5,-104(s0)
    1d72:	17e1                	addi	a5,a5,-8
    1d74:	faf43c23          	sd	a5,-72(s0)
    1d78:	fb843783          	ld	a5,-72(s0)
    1d7c:	00878713          	addi	a4,a5,8
    1d80:	689c                	ld	a5,16(s1)
    1d82:	fcf710e3          	bne	a4,a5,1d42 <schedule_rm+0x232>
            }
        }
        r.allocated_time = find->current_deadline - args.current_time;
    1d86:	fb043783          	ld	a5,-80(s0)
    1d8a:	4bb8                	lw	a4,80(a5)
    1d8c:	409c                	lw	a5,0(s1)
    1d8e:	40f707bb          	subw	a5,a4,a5
    1d92:	2781                	sext.w	a5,a5
    1d94:	f4f42c23          	sw	a5,-168(s0)
    }

    return r;
    1d98:	f5043783          	ld	a5,-176(s0)
    1d9c:	f6f43023          	sd	a5,-160(s0)
    1da0:	f5843783          	ld	a5,-168(s0)
    1da4:	f6f43423          	sd	a5,-152(s0)
    1da8:	f6043703          	ld	a4,-160(s0)
    1dac:	f6843783          	ld	a5,-152(s0)
    1db0:	863a                	mv	a2,a4
    1db2:	86be                	mv	a3,a5
    1db4:	8732                	mv	a4,a2
    1db6:	87b6                	mv	a5,a3
}
    1db8:	853a                	mv	a0,a4
    1dba:	85be                	mv	a1,a5
    1dbc:	742a                	ld	s0,168(sp)
    1dbe:	748a                	ld	s1,160(sp)
    1dc0:	614d                	addi	sp,sp,176
    1dc2:	8082                	ret
